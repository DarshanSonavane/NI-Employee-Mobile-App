import 'package:employee_ni_service/features/appreciation_profile/data/model/model_all_appreciation_response.dart';
import 'package:employee_ni_service/features/appreciation_profile/domain/usecase/get_all_appreciation_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';

part 'fetch_appriciation_event.dart';
part 'fetch_appriciation_state.dart';

class FetchAppriciationBloc
    extends Bloc<FetchAppriciationEvent, FetchAppriciationState> {
  FetchAppriciationBloc({
    GetAllAppreciationUsecase? getAllAppreciationUsecase,
  }) : super(FetchAppriciationInitial()) {
    on<FetchAppriciationEvent>((_, emit) => FetchAppriciationLoading());
    on<GetAllAppreciation>(_onGetAllAppreciation);
  }

  void _onGetAllAppreciation(
    GetAllAppreciation event,
    Emitter<FetchAppriciationState> emit,
  ) async {
    final res = await sl<GetAllAppreciationUsecase>().call();
    res.fold(
      (failure) => emit(FetchAppreciationFailure(failure.toString())),
      (success) => emit(FetchAppreciationSuccess(success)),
    );
  }
}
