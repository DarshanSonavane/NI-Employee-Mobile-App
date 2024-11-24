import 'dart:convert';
import 'package:employee_ni_service/features/complaint/domain/entities/request_close_complaint/request_close_complaint.dart';

class RequestCloseComplaintModel extends RequestCloseComplaint {
  RequestCloseComplaintModel({
    required super.complaintId,
    required super.employeeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'complaintId': complaintId,
      'employeeId': employeeId,
    };
  }

  String toJson() => json.encode(toMap());
}
