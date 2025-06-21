part of 'add_employee_bloc.dart';

@immutable
sealed class AddEmployeeEvent {}

final class AddEmployeeEve extends AddEmployeeEvent {
  final Map<String, dynamic> data;
  AddEmployeeEve({
    required this.data,
  });
}
