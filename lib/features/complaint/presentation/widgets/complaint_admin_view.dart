import 'package:employee_ni_service/features/complaint/data/models/model_complaint_list/response_complaint_details.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/pages/f_service_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../service_locator_dependecies.dart';
import '../bloc/complaint_bloc.dart';
import 'complaint_card.dart';

class ComplaintAdminView extends StatefulWidget {
  final ResponseComplaintDetails? complaintDetails;

  const ComplaintAdminView({
    super.key,
    required this.complaintDetails,
  });

  @override
  State<ComplaintAdminView> createState() => _ComplaintAdminViewState();
}

class _ComplaintAdminViewState extends State<ComplaintAdminView> {
  final hiveStorageService = sl<HiveStorageService>();

  String fetchUserEmployeeId() {
    final fetchUser = hiveStorageService.getUser();
    return fetchUser?.id ?? '';
  }

  void closeComplaint(String complaintId) {
    context.read<ComplaintBloc>().add(
          CloseComplaintsItem(
            complaintId: complaintId,
            employeeId: fetchUserEmployeeId(),
            source: Constants.close,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final complaintDetails = widget.complaintDetails;
    return complaintDetails?.status == Constants.open
        ? complaintDetails!.data.isEmpty
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
                itemCount: complaintDetails.data.length,
                itemBuilder: (context, index) {
                  final complaint = complaintDetails.data[index];
                  return ComplaintCard(
                    name: complaint.customerId.customerName,
                    customerCode: complaint.customerId.customerCode,
                    date: complaint.createdAt.toString(),
                    fuelType: complaint.machineType,
                    location: complaint.customerId.city,
                    state: complaint.customerId.stateCode,
                    complaintType: complaint.complaintType.name,
                    additionalRequest: complaint.additionalReq,
                    feedback: complaint.employeeFeedback,
                    status: complaint.status,
                    complaintId: complaint.id,
                    employee: complaint.assignedTo,
                    onClose: closeComplaint,
                    onGenerateFSR: (
                      String complaintId,
                      String customerName,
                      String customerCode,
                      String employeeCode,
                      String complaintType,
                    ) {
                      Navigator.push(
                        context,
                        FServiceRequest.route(complaintId, customerName,
                            customerCode, employeeCode, complaintType),
                      );
                    },
                    onAssign: (String complaintId) {
                      context.read<ComplaintBloc>().add(
                            GetAllEmployeesList(complaintId),
                          );
                    },
                  );
                },
              )
        :
        // Closed Complaints Tab
        complaintDetails!.data.isEmpty
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
                itemCount: complaintDetails.data.length,
                itemBuilder: (context, index) {
                  final complaint = complaintDetails.data[index];
                  return ComplaintCard(
                    name: complaint.customerId.customerName,
                    customerCode: complaint.customerId.customerCode,
                    date: complaint.createdAt.toString(),
                    fuelType: complaint.machineType,
                    location: complaint.customerId.city,
                    state: complaint.customerId.stateCode,
                    complaintType: complaint.complaintType.name,
                    additionalRequest: complaint.additionalReq,
                    feedback: complaint.employeeFeedback,
                    status: complaint.status,
                    complaintId: complaint.id,
                    employee: complaint.assignedTo,
                  );
                },
              );
  }
}
