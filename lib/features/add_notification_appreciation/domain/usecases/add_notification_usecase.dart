import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_appreciation_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/domain/repository/add_notification_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class AddNotificationUsecase
    extends UseCase<Either, ModelAddNotificationRequest> {
  @override
  Future<Either> call({ModelAddNotificationRequest? params}) {
    return sl<AddNotificationRepository>().addNotification(params!);
  }
}

class AddAppreciationUsecase
    extends UseCase<Either, ModelAddAppreciationRequest> {
  @override
  Future<Either> call({ModelAddAppreciationRequest? params}) {
    return sl<AddAppreciationRepository>().addAppreciation(params!);
  }
}
