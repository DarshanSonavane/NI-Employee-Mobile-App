import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_search_field.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_customer_profile.dart';
import 'package:employee_ni_service/features/customer_profile/domain/entities/entity_customer_profile.dart';
import 'package:employee_ni_service/features/customer_profile/presentation/bloc/customer_profile_bloc.dart';
import 'package:employee_ni_service/features/customer_profile/presentation/widgets/customer_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerProfilePage extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const CustomerProfilePage());
  }

  const CustomerProfilePage({super.key});

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {
  final TextEditingController searchController = TextEditingController();
  ModelCustomerProfile? customerProfile;
  List<CustomerProfileData> visibleCustomers = [];

  @override
  void initState() {
    fetchCustomerProfileData();
    super.initState();
  }

  void fetchCustomerProfileData() {
    context.read<CustomerProfileBloc>().add(GetAllCustomers());
  }

  void filter(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        visibleCustomers = List.from(customerProfile?.data ?? []);
      } else {
        visibleCustomers = (customerProfile?.data ?? []).where((e) {
          final first = e.customerName?.toLowerCase();
          return first?.contains(q) ?? false;
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Customer Profile",
        isBackButtonVisible: true,
        isFromMoreIcon: true,
        isMoreButtonVisible: false,
        navigateTo: "addCustomer",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: CustomSearchField(
              controller: searchController,
              onChanged: filter,
              hintText: 'Search by customer name',
            ),
          ),
          Expanded(
              child: BlocConsumer<CustomerProfileBloc, CustomerProfileState>(
            listener: (context, state) {
              if (state is CustomerProfileFailure) {
                showSnackBar(context, state.errorMessage);
              }
              if (state is CustomerProfileSuccess) {
                customerProfile = state.customerProfile;
                visibleCustomers = List.from(customerProfile?.data ?? []);
              } else if (state is DeleteCustomerProfileSuccess) {
                showSnackBar(context, state.message.message);
                searchController.clear();
                fetchCustomerProfileData();
              }
            },
            builder: (context, state) {
              if (state is CustomerProfileLoading) {
                return const Loader();
              }

              if (visibleCustomers.isEmpty) {
                return const Center(
                  child: Text(
                    'No Customer Found',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppPallete.label2Color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: visibleCustomers.length,
                itemBuilder: (context, index) {
                  final item = visibleCustomers[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: CustomerListWidget(
                      item: item,
                      onDelete: (id) {
                        context.read<CustomerProfileBloc>().add(
                              DeleteCustomerEvent(customerId: id),
                            );
                      },
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
