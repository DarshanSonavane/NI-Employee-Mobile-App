import 'employee_entity.dart';

class HomeDetailsEntity {
  final String? code;
  final String? message;
  final int? totalComplaints;
  final int? openComplaints;
  final int? closeComplaints;
  final List<EmployeeEntity>? employees;

  HomeDetailsEntity({
    required this.code,
    required this.message,
    required this.totalComplaints,
    required this.openComplaints,
    required this.closeComplaints,
    required this.employees,
  });
}
