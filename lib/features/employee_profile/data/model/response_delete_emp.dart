import 'package:employee_ni_service/features/employee_profile/domain/entities/delete_emp_entity.dart';

class ResponseDeleteEmp extends DeleteEmpEntity {
  ResponseDeleteEmp({required super.message});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory ResponseDeleteEmp.fromJson(Map<String, dynamic> json) {
    return ResponseDeleteEmp(
      message: json['message'] as String? ?? '',
    );
  }
}
