import 'package:employee_ni_service/features/complaint/data/models/common_response_model/common_response_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_complaint_list/response_complaint_details.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/dialog_helper.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../service_locator_dependecies.dart';
import '../widgets/complaint_card.dart';
import '../widgets/show_employee_dialog.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen>
    with SingleTickerProviderStateMixin {
  ResponseComplaintDetails? complaintDetails;
  late TabController _tabController;
  final hiveStorageService = sl<HiveStorageService>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    context.read<ComplaintBloc>().add(GetAllComplaintList());
  }

  String fetchUserEmployeeId() {
    var fetchuser = hiveStorageService.getUser();
    return fetchuser!.id;
  }

  void closeComplaintId(String complaintId) {
    context.read<ComplaintBloc>().add(
          CloseComplaintsItem(
              complaintId: complaintId,
              employeeId: fetchUserEmployeeId(),
              source: Constants.close),
        );
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
                            context
                                .read<ComplaintBloc>()
                                .add(GetAllComplaintList());
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
                    }
                  }
                },
                builder: (context, state) {
                  if (state is ComplaintLoader) {
                    return const Loader();
                  } else if (state is ComplaintSuccess &&
                      complaintDetails != null) {
                    final statusZeroComplaints = complaintDetails!.data
                        .where((complaint) => complaint.status == '0')
                        .toList();
                    final otherStatusComplaints = complaintDetails!.data
                        .where((complaint) => complaint.status != '0')
                        .toList();

                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // Open Tab
                        otherStatusComplaints.isEmpty
                            ? const Center(
                                child: Text(
                                  Constants.noOpenComplaints,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: otherStatusComplaints.length,
                                itemBuilder: (context, index) {
                                  final complaint =
                                      otherStatusComplaints[index];
                                  return ComplaintCard(
                                    name: complaint.customerId.customerName,
                                    customerCode:
                                        complaint.customerId.customerCode,
                                    date: complaint.createdAt.toString(),
                                    fuelType: complaint.machineType,
                                    location: complaint.customerId.city,
                                    state: complaint.customerId.stateCode,
                                    complaintType: complaint.complaintType.name,
                                    additionalRequest: complaint.additionalReq,
                                    feedback: complaint.employeeFeedback,
                                    status: complaint.status,
                                    complaintId: complaint.complaintType.id,
                                    onClose: (String complaintId) {
                                      closeComplaintId(complaintId);
                                    },
                                    onAssign: (String complaintId) {
                                      context.read<ComplaintBloc>().add(
                                            GetAllEmployeesList(complaintId),
                                          );
                                    },
                                  );
                                },
                              ),
                        // Closed Tab
                        statusZeroComplaints.isEmpty
                            ? const Center(
                                child: Text(
                                  Constants.noClosedComplaints,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: statusZeroComplaints.length,
                                itemBuilder: (context, index) {
                                  final complaint = statusZeroComplaints[index];
                                  return ComplaintCard(
                                    name: complaint.customerId.customerName,
                                    customerCode:
                                        complaint.customerId.customerCode,
                                    date: complaint.createdAt.toString(),
                                    fuelType: complaint.machineType,
                                    location: complaint.customerId.city,
                                    state: complaint.customerId.stateCode,
                                    complaintType: complaint.complaintType.name,
                                    additionalRequest: complaint.additionalReq,
                                    feedback: complaint.employeeFeedback,
                                    status: complaint.status,
                                    complaintId: complaint.complaintType.id,
                                  );
                                },
                              ),
                      ],
                    );
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
