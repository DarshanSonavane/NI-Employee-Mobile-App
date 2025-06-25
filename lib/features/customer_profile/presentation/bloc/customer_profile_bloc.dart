import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_customer_profile.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_request.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_response.dart';
import 'package:employee_ni_service/features/customer_profile/domain/usecases/delete_customer_usecase.dart';
import 'package:employee_ni_service/features/customer_profile/domain/usecases/fetch_customer_usecase.dart';
import 'package:employee_ni_service/features/customer_profile/domain/usecases/search_customer_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';

part 'customer_profile_event.dart';
part 'customer_profile_state.dart';

class CustomerProfileBloc
    extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  CustomerProfileBloc({
    required FetchCustomerUsecase fetchCustomerUsecase,
    required DeleteCustomerUsecase deleteCustomerUsecase,
    required SearchCustomerUsecase searchCustomerUsecase,
  }) : super(CustomerProfileInitial()) {
    on<CustomerProfileEvent>((_, emit) => emit(CustomerProfileLoading()));
    on<GetAllCustomers>(_onGetAllCustomers);
    on<DeleteCustomerEvent>(_onDeleteCustomer);
    on<SearchCustomers>(_onSearchCustomers);
  }

  void _onGetAllCustomers(
    GetAllCustomers event,
    Emitter<CustomerProfileState> emit,
  ) async {
    final res = await sl<FetchCustomerUsecase>()
        .call(params: ParamsWithPage(page: event.page));
    res.fold(
      (failure) => emit(CustomerProfileFailure(failure.toString(),
          error: 'Error fetching customer data')),
      (success) => emit(CustomerProfileSuccess(success)),
    );
  }

  void _onDeleteCustomer(
    DeleteCustomerEvent event,
    Emitter<CustomerProfileState> emit,
  ) async {
    final res = await sl<DeleteCustomerUsecase>().call(
      params: ModelDeleteCustomerRequest(customerId: event.customerId),
    );

    res.fold(
      (failure) => emit(CustomerProfileFailure(failure.toString(),
          error: 'Something went wrong!!')),
      (success) => emit(DeleteCustomerProfileSuccess(success)),
    );
  }

  void _onSearchCustomers(
    SearchCustomers event,
    Emitter<CustomerProfileState> emit,
  ) async {
    final res = await sl<SearchCustomerUsecase>().call(
      params: ParamsAsValue(value: event.query),
    );
    res.fold(
      (failure) => emit(CustomerProfileFailure(failure.toString(),
          error: 'Error fetching customer data')),
      (success) => emit(CustomerProfileSuccess(success)),
    );
  }
}
