import 'dart:convert';
import 'package:employee_ni_service/features/calibration/domain/entities/add_machine_entity/request_add_machine_entity.dart';

class RequestAddMachineModel extends RequestAddMachineEntity {
  RequestAddMachineModel({
    required super.machineType,
    required super.machineNumber,
    required super.customerCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'model': machineType,
      'machineNumber': machineNumber,
      'customerCode': customerCode,
    };
  }

  String toJson() => json.encode(toMap());
}
