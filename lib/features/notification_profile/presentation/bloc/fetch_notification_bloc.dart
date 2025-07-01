import 'package:employee_ni_service/features/notification_profile/data/model/model_all_notification_response.dart';
import 'package:employee_ni_service/features/notification_profile/domain/usecases/get_all_notification_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';

part 'fetch_notification_event.dart';
part 'fetch_notification_state.dart';

class FetchNotificationBloc
    extends Bloc<FetchNotificationEvent, FetchNotificationState> {
  FetchNotificationBloc({
    GetAllNotificationUsecase? getAllNotificationUsecase,
  }) : super(FetchNotificationInitial()) {
    on<FetchNotificationEvent>((_, emit) => emit(FetchNotificationLoader()));
    on<GetAllNotificationEvent>(_getAllNotification);
  }

  void _getAllNotification(GetAllNotificationEvent event,
      Emitter<FetchNotificationState> emit) async {
    final res = await sl<GetAllNotificationUsecase>().call();
    res.fold(
      (failure) => emit(FetchNotificationFailure(failure.toString())),
      (success) => emit(FetchNotificationSuccess(success)),
    );
  }
}
