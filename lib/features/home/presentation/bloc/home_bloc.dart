import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:employee_ni_service/features/home/domain/usecases/fetch_home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator_dependecies.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required FetchHomeData fetchHomeData,
  }) : super(HomeBlocInitial()) {
    on<HomeEvent>((_, emit) => emit(HomeBlocLoader()));
    on<GetAllHomeDetails>(_onFetchHomeDetails);
  }

  void _onFetchHomeDetails(
    GetAllHomeDetails event,
    Emitter<HomeState> emit,
  ) async {
    final res = await sl<FetchHomeData>().call();
    res.fold(
      (l) => emit(HomeBlocFailure(l.message)),
      (r) => emit(HomeBlocSuccess(r)),
    );
  }
}
