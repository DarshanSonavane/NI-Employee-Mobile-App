part of 'calibration_bloc.dart';

@immutable
sealed class CalibrationState {}

final class CalibrationInitial extends CalibrationState {}

final class CalibrationLoader extends CalibrationState {}

final class CalibrationSuccess<T> extends CalibrationState {
  final T data;
  final String? source;
  CalibrationSuccess(this.data, {this.source});
}

final class CalibrationFailure extends CalibrationState {
  final String errorMessage;
  CalibrationFailure(this.errorMessage);
}
