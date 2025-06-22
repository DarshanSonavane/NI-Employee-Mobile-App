import 'package:employee_ni_service/features/customer_profile/data/model/model_customer_profile.dart';
import 'package:employee_ni_service/features/customer_profile/domain/usecases/fetch_customer_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';

part 'customer_profile_event.dart';
part 'customer_profile_state.dart';

class CustomerProfileBloc
    extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  CustomerProfileBloc({
    required FetchCustomerUsecase fetchCustomerUsecase,
  }) : super(CustomerProfileInitial()) {
    on<CustomerProfileEvent>((_, emit) => emit(CustomerProfileLoading()));
    on<GetAllCustomers>(_onGetAllCustomers);
  }

  void _onGetAllCustomers(
    GetAllCustomers event,
    Emitter<CustomerProfileState> emit,
  ) async {
    final res = await sl<FetchCustomerUsecase>().call();
    res.fold(
      (failure) => emit(CustomerProfileFailure(failure.toString(),
          error: 'Error fetching customer data')),
      (success) => emit(CustomerProfileSuccess(success)),
    );
  }
}
