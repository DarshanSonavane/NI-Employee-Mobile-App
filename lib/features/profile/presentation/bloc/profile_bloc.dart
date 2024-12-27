import 'package:employee_ni_service/features/profile/data/model/request_employee_profile.dart';
import 'package:employee_ni_service/features/profile/data/model/response_employee_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
import '../../domain/usecases/fetch_employee_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required FetchEmployeeProfileUsecase fetchEmployeeProfileUseCase,
  }) : super(ProfileInitial()) {
    on<ProfileEvent>((_, emit) => emit(ProfileLoader()));
    on<GetEmployeeProfileEvent>(_onGetProfileDetails);
  }

  void _onGetProfileDetails(
    GetEmployeeProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final res = await sl<FetchEmployeeProfileUsecase>().call(
        params: RequestEmployeeProfile(
      employeeId: event.employeeId,
    ));

    res.fold(
      (failure) => emit(ProfileFailure(failure.toString())),
      (success) => emit(ProfileSuccess(success)),
    );
  }
}
