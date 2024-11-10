part of 'calibration_bloc.dart';

@immutable
sealed class CalibrationState {}

final class CalibrationInitial extends CalibrationState {}

final class CalibrationLoader extends CalibrationState {}

final class CalibrationSuccess extends CalibrationState {
  final ResponseCalibrationDetails calibrationDetails;
  CalibrationSuccess(this.calibrationDetails);
}

final class CalibrationFailure extends CalibrationState {
  final String errorMessage;
  CalibrationFailure(this.errorMessage);
}
