import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../service_locator_dependecies.dart';
import '../../data/models/model_complaint_list/response_complaint_details.dart';
import '../bloc/complaint_bloc.dart';
import 'complaint_card.dart';

class ComplaintEmployeeView extends StatefulWidget {
  final ResponseComplaintDetails? complaintDetails;

  const ComplaintEmployeeView({
    super.key,
    required this.complaintDetails,
  });

  @override
  State<ComplaintEmployeeView> createState() => _ComplaintEmployeeViewState();
}

class _ComplaintEmployeeViewState extends State<ComplaintEmployeeView> {
  late List<dynamic> allComplaints;

  @override
  void initState() {
    super.initState();
    _sortComplaints();
  }

  void _sortComplaints() {
    // First add open complaints, then closed complaints
    allComplaints = [
      ...widget.complaintDetails?.data
              .where((complaint) =>
                  complaint.status == '1' || complaint.status == '0')
              .toList() ??
          [],
      ...widget.complaintDetails?.data
              .where((complaint) => complaint.status == '2')
              .toList() ??
          [],
    ];
  }

  String fetchUserEmployeeId() {
    final hiveStorageService = sl<HiveStorageService>();
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

  @override
  Widget build(BuildContext context) {
    if (allComplaints.isEmpty) {
      return const Center(
        child: Text(
          'No complaints found',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: allComplaints.length,
      itemBuilder: (context, index) {
        final complaint = allComplaints[index];
        final isOpen = complaint.status == '1' || complaint.status == '0';

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
          onClose: isOpen
              ? (String complaintId) => closeComplaintId(complaintId)
              : null,
          onAssign: isOpen
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
