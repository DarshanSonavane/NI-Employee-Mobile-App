import 'dart:async';

import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_search_field.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/add_customer/presentation/pages/add_customer.dart';
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
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    fetchCustomerProfileData(page: _currentPage);
    _scrollController.addListener(() {
      final triggerPosition = _scrollController.position.maxScrollExtent - 100;

      if (_scrollController.position.pixels >= triggerPosition &&
          !_isLoadingMore &&
          _hasMoreData) {
        _isLoadingMore = true;
        _currentPage += 1;
        fetchCustomerProfileData(page: _currentPage);
      }
    });
  }

  void fetchCustomerProfileData({int page = 1}) {
    context.read<CustomerProfileBloc>().add(GetAllCustomers(page: page));
  }

  void filter(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final q = query.trim();

      if (q.isEmpty) {
        // When cleared, reload first page
        _currentPage = 1;
        _hasMoreData = true;
        visibleCustomers.clear();
        fetchCustomerProfileData(page: _currentPage);
        return;
      }

      // Remote API search, assuming no pagination needed for search
      context.read<CustomerProfileBloc>().add(SearchCustomers(query: q));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    _scrollController.dispose();
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
              hintText: 'Customer name or code',
            ),
          ),
          Expanded(
              child: BlocConsumer<CustomerProfileBloc, CustomerProfileState>(
            listener: (context, state) {
              if (state is CustomerProfileFailure) {
                showSnackBar(context, state.errorMessage);
              }
              if (state is CustomerProfileSuccess) {
                final newData = state.customerProfile.data;

                if (_currentPage == 1) {
                  visibleCustomers.clear();
                  _hasMoreData = true;
                  visibleCustomers.addAll(newData);
                } else {
                  if (newData.isEmpty) {
                    _hasMoreData = false;
                  } else {
                    visibleCustomers.addAll(newData);
                  }
                }

                customerProfile = state.customerProfile;
                _isLoadingMore = false;
              } else if (state is DeleteCustomerProfileSuccess) {
                showSnackBar(context, state.message.message);
                searchController.clear();
                _currentPage = 1;
                visibleCustomers.clear();
                fetchCustomerProfileData();
              }
            },
            builder: (context, state) {
              if (state is CustomerProfileLoading &&
                  _currentPage == 1 &&
                  visibleCustomers.isEmpty) {
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
                controller: _scrollController,
                itemCount: visibleCustomers.length + (_isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < visibleCustomers.length) {
                    final item = visibleCustomers[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      child: CustomerListWidget(
                        item: item,
                        onDelete: (id) {
                          context
                              .read<CustomerProfileBloc>()
                              .add(DeleteCustomerEvent(customerId: id));
                        },
                        onEdit: (item) {
                          Navigator.push(context, AddCustomer.route(item));
                        },
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Loader(),
                    );
                  }
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
