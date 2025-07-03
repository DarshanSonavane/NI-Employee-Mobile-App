import 'package:employee_ni_service/features/add_customer/data/model/model_add_customer.dart';
import 'package:employee_ni_service/features/add_customer/data/model/model_state_list.dart';
import 'package:employee_ni_service/features/add_customer/domain/usecases/add_customer_usecase.dart';
import 'package:employee_ni_service/features/add_customer/domain/usecases/fetch_states_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../service_locator_dependecies.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc({
    required FetchStatesUsecase fetchStatesUsecase,
    required AddCustomerUsecase addCustomerUsecase,
  }) : super(AddCustomerInitial()) {
    on<AddCustomerEvent>((_, emit) => emit(AddCustomerLoading()));
    on<GetStatesEvent>(_onGetStates);
    on<CreateCustomer>(_onCreateCustomer);
  }

  void _onGetStates(
    GetStatesEvent event,
    Emitter<AddCustomerState> emit,
  ) async {
    final res = await sl<FetchStatesUsecase>().call();
    res.fold(
      (failure) => emit(AddCustomerFailure(failure.toString(),
          error: 'Error fetching customer data')),
      (success) => emit(FetchStateSuccess(success)),
    );
  }

  void _onCreateCustomer(
    CreateCustomer event,
    Emitter<AddCustomerState> emit,
  ) async {
    final rawDob = event.data['Amc Date'];
    final DateTime dobDt =
        rawDob is DateTime ? rawDob : DateTime.parse(rawDob.toString());
    final String amcDue = DateFormat('yyyy-MM-dd').format(dobDt);

    final res = await sl<AddCustomerUsecase>().call(
      params: ModelAddCustomer(
        customerCode: event.data['Customer Code'],
        customerName: event.data['Customer Name'],
        city: event.data['City'],
        amcDue: amcDue,
        mobileNumber: event.data['Mobile Number'] ?? '',
        email: event.data['Email'] ?? '',
        gstNumber: event.data['GST No.'] ?? '',
        customerId: event.data['customerId'] ?? '',
        petrolMachineNumber: event.data['Petrol Machine No.'] ?? '',
        dieselMachineNumber: event.data['Diesel Machine No.'] ?? '',
        comboMachineNumber: event.data['Combo Machine No.'] ?? '',
        stateCode: event.data['state'],
      ),
    );

    res.fold(
      (failure) => emit(AddCustomerFailure(failure, error: failure.toString())),
      (success) => emit(AddCustomerSuccess(
        'Customer added successfully',
      )),
    );
  }
}
