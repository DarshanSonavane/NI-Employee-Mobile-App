import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/employee_profile/domain/usecases/delete_profile_usecase.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_profile_event.dart';
part 'employee_profile_state.dart';

class EmployeeProfileBloc
    extends Bloc<EmployeeProfileEvent, EmployeeProfileState> {
  EmployeeProfileBloc({
    required DeleteProfileUsecase deleteEmployeeUsecase,
  }) : super(EmployeeProfileInitial()) {
    on<EmployeeProfileEvent>((_, emit) => emit(EmployeeProfileLoading()));
    on<DeleteEmployeeEvent>(_onDeleteEmployee);
  }

  void _onDeleteEmployee(
    DeleteEmployeeEvent event,
    Emitter<EmployeeProfileState> emit,
  ) async {
    final res = await sl<DeleteProfileUsecase>().call(
      params: ParamsAsValue(value: event.employeeId),
    );

    res.fold(
      (failure) => emit(EmployeeProfileFailure(error: failure.toString())),
      (success) => emit(
          EmployeeProfileSuccess(message: 'Employee deleted successfully')),
    );
  }
}
