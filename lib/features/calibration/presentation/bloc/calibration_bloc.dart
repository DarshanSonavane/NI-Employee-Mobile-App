import 'package:employee_ni_service/features/calibration/data/model/model_cylinder_details/response_cylinder_details.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/request_delete_calibration_model.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/response_delete_calibration_model.dart';
import 'package:employee_ni_service/features/calibration/domain/usecases/delete_calibration_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator_dependecies.dart';
import '../../data/model/model_calibration_details/response_calibration_details.dart';
import '../../data/model/model_update_cylinder/request_update_cylinder_details.dart';
import '../../domain/usecases/fetch_calibration_data.dart';
import '../../domain/usecases/fetch_cylinder_details.dart';
import '../../domain/usecases/generate_and_send_calibration_usecase.dart';
import '../../domain/usecases/update_cylinder_details_usecase.dart';
part 'calibration_event.dart';
part 'calibration_state.dart';

class CalibrationBloc extends Bloc<CalibrationEvent, CalibrationState> {
  final FetchCalibrationData fetchCalibrationData;
  final FetchCylinderDetails fetchCylinderDetails;
  final UpdateCylinderDetailsUseCase updateCylinderDetailsUseCase;
  final DeleteCalibrationUsecase deleteCalibrationUsecase;
  final GenerateAndSendCalibrationUsecase generateAndSendCalibrationUsecase;
  CalibrationBloc(
      {required this.fetchCalibrationData,
      required this.fetchCylinderDetails,
      required this.updateCylinderDetailsUseCase,
      required this.deleteCalibrationUsecase,
      required this.generateAndSendCalibrationUsecase})
      : super(CalibrationInitial()) {
    on<CalibrationEvent>((_, emit) => emit((CalibrationLoader())));
    on<GetAllCalibrationList>(_onFetchCalibrationDetails);
    on<GetCylinderDetails>(_onFetchCylinderDetails);
    on<UpdateCylinderDetails>(_onUpdateCylinderDetails);
    on<DeleteCalibrationItem>(_onDeleteCalibrationItems);
    on<GenerateAndSendCalibrationItem>(_onGenerateAndSendCalibrationItem);
  }

  void _onFetchCalibrationDetails(
    GetAllCalibrationList event,
    Emitter<CalibrationState> emit,
  ) async {
    final res = await sl<FetchCalibrationData>().call();
    res.fold(
      (l) => emit(CalibrationFailure(l.message)),
      (r) => emit(CalibrationSuccess<ResponseCalibrationDetails>(r)),
    );
  }

  void _onFetchCylinderDetails(
    GetCylinderDetails event,
    Emitter<CalibrationState> emit,
  ) async {
    final res = await sl<FetchCylinderDetails>().call();
    res.fold(
      (l) => emit(CalibrationFailure(l.message)),
      (r) => emit(CalibrationSuccess<ResponseCylinderDetails>(r)),
    );
  }

  void _onUpdateCylinderDetails(
    UpdateCylinderDetails event,
    Emitter<CalibrationState> emit,
  ) async {
    final res = await sl<UpdateCylinderDetailsUseCase>().call(
        params: RequestUpdateCylinderDetails(
      sId: event.cylinderDetails.sId,
      cO: event.cylinderDetails.cO,
      cO2: event.cylinderDetails.cO2,
      hC: event.cylinderDetails.hC,
      o2: event.cylinderDetails.o2,
      cylinderNumber: event.cylinderDetails.cylinderNumber,
      cylinderMake: event.cylinderDetails.cylinderMake,
      validityDate: event.cylinderDetails.validityDate,
      createdBy: event.cylinderDetails.createdBy,
    ));
    res.fold(
      (l) => emit(CalibrationFailure(l.message)),
      (r) => emit(CalibrationSuccess<ResponseCylinderDetails>(r)),
    );
  }

  void _onDeleteCalibrationItems(
    DeleteCalibrationItem event,
    Emitter<CalibrationState> emit,
  ) async {
    final res = await sl<DeleteCalibrationUsecase>().call(
        params: RequestDeleteCalibrationModel(
      calibrationId: event.calibrationId,
    ));
    res.fold(
      (l) => emit(CalibrationFailure(l.message)),
      (r) => emit(CalibrationSuccess<ResponseDeleteCalibrationModel>(r)),
    );
  }

  void _onGenerateAndSendCalibrationItem(
    GenerateAndSendCalibrationItem event,
    Emitter<CalibrationState> emit,
  ) async {
    final res = await sl<GenerateAndSendCalibrationUsecase>().call(
        params: RequestDeleteCalibrationModel(
      calibrationId: event.calibrationId,
    ));
    res.fold(
      (l) => emit(CalibrationFailure(l.message)),
      (r) => emit(CalibrationSuccess<ResponseDeleteCalibrationModel>(r)),
    );
  }
}
