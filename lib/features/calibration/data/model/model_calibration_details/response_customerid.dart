import 'dart:convert';

import 'package:employee_ni_service/features/calibration/domain/entities/calibration_details_entity/customer_id.dart';

class ResponseCustomerid extends CustomerId {
  ResponseCustomerid({
    required super.sId,
    required super.customerCode,
    required super.customerName,
    required super.city,
    required super.amcDue,
    required super.mobile,
    required super.email,
    required super.gstNo,
    required super.password,
    required super.petrolMachineNumber,
    required super.dieselMachineNumber,
    required super.comboMachineNumber,
    required super.stateCode,
    required super.machineModel,
    required super.iV,
  });

  factory ResponseCustomerid.fromMap(Map<String, dynamic> map) {
    return ResponseCustomerid(
      sId: map['_id'] != null ? map['_id'] as String : null,
      customerCode:
          map['customerCode'] != null ? map['customerCode'] as String : null,
      customerName:
          map['customerName'] != null ? map['customerName'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      amcDue: map['amcDue'] != null ? map['amcDue'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      gstNo: map['gstNo'] != null ? map['gstNo'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      petrolMachineNumber: map['petrolMachineNumber'] != null
          ? map['petrolMachineNumber'] as String
          : null,
      dieselMachineNumber: map['dieselMachineNumber'] != null
          ? map['dieselMachineNumber'] as String
          : null,
      comboMachineNumber: map['comboMachineNumber'] != null
          ? map['comboMachineNumber'] as String
          : null,
      stateCode: map['stateCode'] != null ? map['stateCode'] as String : null,
      machineModel:
          map['machineModel'] != null ? map['machineModel'] as String : null,
      iV: map['__v'] != null ? map['__v'] as int : null,
    );
  }

  factory ResponseCustomerid.fromJson(String source) =>
      ResponseCustomerid.fromMap(json.decode(source) as Map<String, dynamic>);
}
