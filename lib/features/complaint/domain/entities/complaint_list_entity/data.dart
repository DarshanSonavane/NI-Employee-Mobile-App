import 'complaint_type.dart';
import 'customer_id.dart';

class Data {
  String? sId;
  CustomerId? customerId;
  String? machineType;
  ComplaintType? complaintType;
  String? status;
  String? employeeFeedback;
  String? assignedTo;
  String? additionalReq;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.customerId,
      this.machineType,
      this.complaintType,
      this.status,
      this.employeeFeedback,
      this.assignedTo,
      this.additionalReq,
      this.createdAt,
      this.updatedAt,
      this.iV});
}
