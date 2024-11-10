import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
import '../../data/model/response_calibration_details.dart';
import '../../domain/usecases/fetch_calibration_data.dart';
part 'calibration_event.dart';
part 'calibration_state.dart';

class CalibrationBloc extends Bloc<CalibrationEvent, CalibrationState> {
  CalibrationBloc({
    required FetchCalibrationData fetchCalibrationData,
  }) : super(CalibrationInitial()) {
    on<CalibrationEvent>((_, emit) => emit((CalibrationLoader())));
    on<GetAllCalibrationList>(_onFetchCalibrationDetails);
  }

  void _onFetchCalibrationDetails(
    GetAllCalibrationList event,
    Emitter<CalibrationState> emit,
  ) async {
    final res = await sl<FetchCalibrationData>().call();
    res.fold(
      (l) => emit(CalibrationFailure(l.message)),
      (r) => emit(CalibrationSuccess(r)),
    );
  }
}
