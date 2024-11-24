import 'dart:convert';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_data.dart';
import 'package:employee_ni_service/features/complaint/domain/entities/entity_response_employee_details/response_employee_entity.dart';

class ResponseEmployeeModel extends ResponseEmployeeEntity {
  ResponseEmployeeModel({
    required super.message,
    required super.employeeData,
  });

  factory ResponseEmployeeModel.fromMap(Map<String, dynamic> map) {
    return ResponseEmployeeModel(
      message: map['message'] as String,
      employeeData: List<ResponseEmployeeData>.from(
        (map['data'] as List).map(
          (x) => ResponseEmployeeData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ResponseEmployeeModel.fromJson(String source) =>
      ResponseEmployeeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
