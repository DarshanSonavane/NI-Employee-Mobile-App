import 'package:employee_ni_service/features/add_customer/data/model/model_state_list.dart';
import 'package:employee_ni_service/features/add_customer/domain/usecases/fetch_states_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc({
    required FetchStatesUsecase fetchStatesUsecase,
  }) : super(AddCustomerInitial()) {
    on<AddCustomerEvent>((_, emit) => emit(AddCustomerLoading()));
    on<GetStatesEvent>(_onGetStates);
  }

  void _onGetStates(
    GetStatesEvent event,
    Emitter<AddCustomerState> emit,
  ) async {
    final res = await sl<FetchStatesUsecase>().call();
    res.fold(
      (failure) => emit(AddCustomerFailure(failure.toString(),
          error: 'Error fetching customer data')),
      (success) => emit(AddCustomerSuccess(success)),
    );
  }
}
