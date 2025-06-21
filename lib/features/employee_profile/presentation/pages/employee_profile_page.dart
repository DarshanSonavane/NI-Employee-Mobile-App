import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_search_field.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/bloc/assign_product_to_employee_bloc.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
import 'package:employee_ni_service/features/complaint/domain/entities/entity_response_employee_details/employee_data.dart';
import 'package:employee_ni_service/features/employee_profile/presentation/bloc/employee_profile_bloc.dart';
import 'package:employee_ni_service/features/employee_profile/presentation/widgets/employee_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeProfilePage extends StatefulWidget {
  static Route route() =>
      createSlideTransitionRoute(const EmployeeProfilePage());

  const EmployeeProfilePage({super.key});

  @override
  State<EmployeeProfilePage> createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  final TextEditingController searchController = TextEditingController();
  ResponseEmployeeModel? employeeModel;
  List<EmployeeData> visibleEmployees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployeeList();
  }

  void fetchEmployeeList() {
    context.read<AssignProductToEmployeeBloc>().add(GetAllEmployeesList());
  }

  void filter(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        visibleEmployees = List.from(employeeModel?.employeeData ?? []);
      } else {
        visibleEmployees = (employeeModel?.employeeData ?? []).where((e) {
          final first = e.firstName.toLowerCase();
          final last = e.lastName.toLowerCase();
          return first.contains(q) || last.contains(q);
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
        title: "Employee Profile",
        isBackButtonVisible: true,
        isFromMoreIcon: true,
        isMoreButtonVisible: false,
        navigateTo: "addEmployee",
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomSearchField(
                  controller: searchController,
                  onChanged: filter,
                ),
              ),
              Expanded(
                child: BlocConsumer<AssignProductToEmployeeBloc,
                    AssignProductToEmployeeState>(
                  listener: (context, state) {
                    if (state is AssignProductToEmployeeFailure) {
                      showSnackBar(context, state.message);
                    }
                    if (state is AssignProductToEmployeeSuccess) {
                      employeeModel = state.data;
                      visibleEmployees = List.from(employeeModel!.employeeData);
                    }
                  },
                  builder: (context, state) {
                    if (state is AssignProductToEmployeeLoading) {
                      return const Loader();
                    }

                    if (visibleEmployees.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Employee Found',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppPallete.label2Color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: visibleEmployees.length,
                      itemBuilder: (_, i) => EmployeeListWidget(
                        item: visibleEmployees[i],
                        onDelete: (id) {
                          context.read<EmployeeProfileBloc>().add(
                                DeleteEmployeeEvent(employeeId: id),
                              );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Loader for delete action
          BlocConsumer<EmployeeProfileBloc, EmployeeProfileState>(
            listener: (context, state) {
              if (state is EmployeeProfileFailure) {
                showSnackBar(context, state.error);
              }
              if (state is EmployeeProfileSuccess) {
                showSnackBar(context, state.message);
                fetchEmployeeList(); // Refresh list after delete
              }
            },
            builder: (context, state) {
              if (state is EmployeeProfileLoading) {
                return const Loader(); // Overlay loader
              }
              return const SizedBox.shrink(); // Don't rebuild anything else
            },
          ),
        ],
      ),
    );
  }
}
