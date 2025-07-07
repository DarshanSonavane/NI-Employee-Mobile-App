import 'package:employee_ni_service/features/add_employee/data/model/request_add_employee.dart';
import 'package:employee_ni_service/features/add_employee/domain/usecases/add_employee_usecase.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  AddEmployeeBloc({
    required AddEmployeeUsecase addEmployeeUsecase,
  }) : super(AddEmployeeInitial()) {
    on<AddEmployeeEvent>((_, emit) => emit(AddEmployeeLoading()));
    on<AddEmployeeEve>(_onAddEmployee);
  }
  void _onAddEmployee(
    AddEmployeeEve event,
    Emitter<AddEmployeeState> emit,
  ) async {
    final rawDob = event.data['Date of Birth'];

    final DateTime dobDt =
        rawDob is DateTime ? rawDob : DateTime.parse(rawDob.toString());
    final String dobFormatted = DateFormat('dd/MM/yyyy').format(dobDt);

    final res = await sl<AddEmployeeUsecase>().call(
      params: RequestAddEmployee(
        firstName: event.data['First Name'],
        lastName: event.data['Last Name'],
        employeeCode: event.data['employeeCode'],
        dob: dobFormatted,
        phone: event.data['Mobile Number'],
        email: event.data['Email'],
        gender: event.data['gender'],
        role: event.data['role'],
        isActive: event.data['isActive'],
      ),
    );

    res.fold(
      (failure) => emit(AddEmployeeFailure(failure, error: failure.toString())),
      (user) => emit(AddEmployeeSuccess(
        message: 'Employee added successfully',
      )),
    );
  }
}
