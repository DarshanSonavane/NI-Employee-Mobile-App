import 'employee_data.dart';

class ResponseEmployeeEntity {
  String message;
  List<EmployeeData> employeeData;
  ResponseEmployeeEntity({
    required this.message,
    required this.employeeData,
  });
}
