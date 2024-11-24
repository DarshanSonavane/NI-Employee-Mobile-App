part of 'calibration_bloc.dart';

@immutable
sealed class CalibrationEvent {}

final class GetAllCalibrationList extends CalibrationEvent {}

final class GetCylinderDetails extends CalibrationEvent {}

final class UpdateCylinderDetails extends CalibrationEvent {
  final RequestUpdateCylinderDetails cylinderDetails;
  UpdateCylinderDetails({required this.cylinderDetails});
}

final class DeleteCalibrationItem extends CalibrationEvent {
  final String calibrationId;
  DeleteCalibrationItem({required this.calibrationId});
}

final class GenerateAndSendCalibrationItem extends CalibrationEvent {
  final String calibrationId;
  GenerateAndSendCalibrationItem({required this.calibrationId});
}

final class AddMachineDetails extends CalibrationEvent {
  final RequestAddMachineModel requestAddMachineModel;
  AddMachineDetails({required this.requestAddMachineModel});
}
