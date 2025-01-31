import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:employee_ni_service/features/home/domain/usecases/fetch_home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator_dependecies.dart';
import '../../data/model/request_fsr_model.dart';
import '../../domain/usecases/fetch_fsr_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required FetchHomeData fetchHomeData,
    required FetchFsrUsecase fetchFSRListUsecase,
  }) : super(HomeBlocInitial()) {
    on<HomeEvent>((_, emit) => emit(HomeBlocLoader()));
    on<GetAllHomeDetails>(_onFetchHomeDetails);
    on<GetFSRList>(_onGetFSRList);
  }

  void _onFetchHomeDetails(
    GetAllHomeDetails event,
    Emitter<HomeState> emit,
  ) async {
    final res = await sl<FetchHomeData>().call();
    res.fold(
      (l) => emit(HomeBlocFailure(l)),
      (r) => emit(HomeBlocSuccess<ResponseHomeDetails>(r)),
    );
  }

  void _onGetFSRList(
    GetFSRList event,
    Emitter<HomeState> emit,
  ) async {
    final res = await sl<FetchFsrUsecase>().call(
        params: RequestFsrModel(
      employeeId: event.employeeId,
      role: event.role,
    ));

    res.fold(
      (failure) => emit(HomeBlocFailure(failure.toString())),
      (success) => emit(HomeBlocSuccess<ResponseFsrModel>(success)),
    );
  }
}
