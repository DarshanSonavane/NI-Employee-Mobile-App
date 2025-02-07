import 'package:employee_ni_service/features/complaint/data/models/model_employee_complaint/employee_complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../service_locator_dependecies.dart';
import '../../../f_service_request/presentation/pages/f_service_request.dart';
import '../bloc/complaint_bloc.dart';
import 'complaint_card.dart';

class ComplaintEmployeeView extends StatefulWidget {
  final EmployeeComplaintModel? complaintDetails;
  final bool isOpenTab; // Add this to determine which tab we're in

  const ComplaintEmployeeView({
    super.key,
    required this.complaintDetails,
    required this.isOpenTab,
  });

  @override
  State<ComplaintEmployeeView> createState() => _ComplaintEmployeeViewState();
}

class _ComplaintEmployeeViewState extends State<ComplaintEmployeeView> {
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
    if (widget.complaintDetails == null) {
      return const Center(
        child: Text(
          'No complaints found',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
        ),
      );
    }

    final filteredComplaints = widget.complaintDetails!.data.where((complaint) {
      if (widget.isOpenTab) {
        return complaint.serviceRequestId?.status == '1' ||
            complaint.serviceRequestId?.status == '2';
      } else {
        return complaint.serviceRequestId?.status == '0';
      }
    }).toList();

    if (filteredComplaints.isEmpty) {
      return Center(
        child: Text(
          widget.isOpenTab
              ? Constants.noOpenComplaints
              : Constants.noClosedComplaints,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredComplaints.length,
      itemBuilder: (context, index) {
        final complaint = filteredComplaints[index];
        return ComplaintCard(
          name: complaint.serviceRequestId?.customerId?.customerName ?? '',
          customerCode:
              complaint.serviceRequestId?.customerId?.customerCode ?? '',
          date: complaint.serviceRequestId?.createdAt.toString() ?? '',
          fuelType: complaint.serviceRequestId?.machineType ?? '',
          location: complaint.serviceRequestId?.customerId?.city ?? '',
          state: complaint.serviceRequestId?.customerId?.stateCode ?? '',
          complaintType: complaint.serviceRequestId?.complaintType?.name ?? '',
          additionalRequest: complaint.serviceRequestId?.additionalReq ?? '',
          feedback: complaint.serviceRequestId?.employeeFeedback ?? '',
          status: complaint.serviceRequestId?.status ?? '',
          complaintId: complaint.id ?? '',
          onClose: widget.isOpenTab ? closeComplaint : null,
          onGenerateFSR: widget.isOpenTab
              ? (
                  String complaintId,
                  String customerName,
                  String customerCode,
                  String employeeCode,
                  String complaintType,
                ) {
                  Navigator.push(
                      context,
                      FServiceRequest.route(
                          complaintId,
                          complaint
                                  .serviceRequestId?.customerId?.customerCode ??
                              '',
                          complaint
                                  .serviceRequestId?.customerId?.customerName ??
                              '',
                          hiveStorageService.getUser()!.employeeCode,
                          complaint.serviceRequestId?.complaintType?.name ??
                              ''));
                }
              : null,
          onAssign: widget.isOpenTab
              ? (String complaintId) {
                  context.read<ComplaintBloc>().add(
                        GetAllEmployeesList(complaintId),
                      );
                }
              : null,
        );
      },
    );
  }
}
