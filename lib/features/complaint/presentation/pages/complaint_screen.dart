import 'package:employee_ni_service/features/complaint/data/models/common_response_model/common_response_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_complaint_list/response_complaint_details.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_employee_complaint/employee_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
import 'package:employee_ni_service/features/complaint/presentation/widgets/complaint_admin_view.dart';
import 'package:employee_ni_service/features/complaint/presentation/widgets/complaint_employee_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/dialog_helper.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../widgets/show_employee_dialog.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen>
    with SingleTickerProviderStateMixin {
  ResponseComplaintDetails? complaintDetails;
  EmployeeComplaintModel? employeeComplaintDetails;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _fetchDataForTab(_tabController.index);
      }
    });
    super.initState();
  }

  void _fetchDataForTab(int index) {
    if (index == 0) {
      context
          .read<ComplaintBloc>()
          .add(GetAllComplaintList(complaintType: Constants.activeComplaints));
    } else {
      context
          .read<ComplaintBloc>()
          .add(GetAllComplaintList(complaintType: Constants.closedComplaints));
    }
  }

  void assignComplaints(String? complaintId, String? selectedEmployee) {
    context.read<ComplaintBloc>().add(
          CloseComplaintsItem(
              complaintId: complaintId!,
              employeeId: selectedEmployee!,
              source: Constants.assigned),
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Column(
        children: [
          Container(
            color: AppPallete.gradientColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppPallete.backgroundColor,
              labelColor: AppPallete.backgroundColor,
              unselectedLabelColor: AppPallete.label2Color,
              tabs: const [
                Tab(text: Constants.activeComplaints),
                Tab(text: Constants.closedComplaints),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocConsumer<ComplaintBloc, ComplaintState>(
                listener: (context, state) {
                  if (state is ComplaintFailure) {
                    showSnackBar(context, state.errorMessage);
                  } else if (state is ComplaintSuccess) {
                    if (state.data is ResponseComplaintDetails) {
                      complaintDetails = state.data;
                    } else if (state.data is CommonResponseComplaintModel) {
                      final response =
                          state.data as CommonResponseComplaintModel;
                      DialogHelper.showAlertDialog(
                          context: context,
                          message: response.message!,
                          onButtonPressed: () {
                            Navigator.pop(context);
                            if (_tabController.index == 0) {
                              context.read<ComplaintBloc>().add(
                                  GetAllComplaintList(
                                      complaintType:
                                          Constants.activeComplaints));
                            } else {
                              context.read<ComplaintBloc>().add(
                                  GetAllComplaintList(
                                      complaintType:
                                          Constants.closedComplaints));
                            }
                          });
                    } else if (state.data is ResponseEmployeeModel) {
                      final response = state.data as ResponseEmployeeModel;
                      final employees = response.employeeData;
                      final complaintId = state.complaintId;
                      showEmployeeDialog(
                        context,
                        employees,
                        (selectedEmployee) {
                          assignComplaints(complaintId, selectedEmployee);
                        },
                      );
                    } else if (state.data is EmployeeComplaintModel) {
                      employeeComplaintDetails = state.data;
                    }
                  }
                },
                builder: (context, state) {
                  if (state is ComplaintLoader) {
                    return const Loader();
                  } else if (state is ComplaintSuccess) {
                    if (state.data is ResponseComplaintDetails) {
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          ComplaintAdminView(
                              complaintDetails: complaintDetails),
                          ComplaintAdminView(
                              complaintDetails: complaintDetails),
                        ],
                      );
                    } else if (state.data is EmployeeComplaintModel) {
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          ComplaintEmployeeView(
                            complaintDetails: employeeComplaintDetails,
                            isOpenTab: true,
                          ),
                          ComplaintEmployeeView(
                            complaintDetails: employeeComplaintDetails,
                            isOpenTab: false,
                          ),
                        ],
                      );
                    }
                  }
                  return const Center(
                    child: Text(
                      Constants.noComplaintsAvailable,
                      style: TextStyle(
                        color: AppPallete.gradientColor,
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
