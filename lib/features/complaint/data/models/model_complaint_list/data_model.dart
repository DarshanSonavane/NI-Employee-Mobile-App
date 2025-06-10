import '../../../domain/entities/complaint_list_entity/data.dart';
import 'customer_id_model.dart';
import 'customer_type_model.dart';

class DataModel extends Data {
  DataModel(
      {required super.sId,
      required super.customerId,
      required super.machineType,
      required super.complaintType,
      required super.status,
      required super.employeeFeedback,
      required super.assignedTo,
      required super.additionalReq,
      required super.createdAt,
      required super.updatedAt,
      required super.iV});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      sId: json['_id'] as String?,
      customerId: json['customerId'] != null
          ? CustomerIdModel.fromJson(json['customerId'])
          : null,
      machineType: json['machineType'] as String?,
      complaintType: json['complaintType'] != null
          ? ComplaintTypeModel.fromJson(json['complaintType'])
          : null,
      status: json['status'] as String?,
      employeeFeedback: json['employeeFeedback'] as String?,
      assignedTo: json['assignedTo'] as String?,
      additionalReq: json['additionalReq'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['__v'] as int?,
    );
  }
}
