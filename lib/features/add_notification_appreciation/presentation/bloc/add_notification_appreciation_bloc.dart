import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_appreciation_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_response.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/domain/usecases/add_notification_usecase.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_notification_appreciation_event.dart';
part 'add_notification_appreciation_state.dart';

class AddNotificationAppreciationBloc extends Bloc<
    AddNotificationAppreciationEvent, AddNotificationAppreciationState> {
  AddNotificationAppreciationBloc({
    AddNotificationUsecase? addNotificationUsecase,
    AddAppreciationUsecase? addAppreciationUsecase,
  }) : super(AddNotificationAppreciationInitial()) {
    on<AddNotificationAppreciationEvent>(
        (_, emit) => emit(AddNotificationAppreciationLoading()));
    on<AddNotificationEvent>(_onAddNotification);
    on<AddAppreciationEvent>(_onAddAppreciation);
  }

  void _onAddNotification(
    AddNotificationEvent event,
    Emitter<AddNotificationAppreciationState> emit,
  ) async {
    final res = await sl<AddNotificationUsecase>().call(
      params: ModelAddNotificationRequest(
          message: event.message,
          base64File: event.base64File,
          fileExtension: event.fileExtension),
    );

    res.fold(
      (l) => emit(AddNotificationAppreciationFailure(l)),
      (r) => emit(AddNotificationAppreciationSuccess(r)),
    );
  }

  void _onAddAppreciation(
    AddAppreciationEvent event,
    Emitter<AddNotificationAppreciationState> emit,
  ) async {
    final res = await sl<AddAppreciationUsecase>().call(
      params: ModelAddAppreciationRequest(
        key: event.key,
        employeeId: event.empId,
        description: event.description,
      ),
    );

    res.fold(
      (l) => emit(AddNotificationAppreciationFailure(l)),
      (r) => emit(AddNotificationAppreciationSuccess(r)),
    );
  }
}
