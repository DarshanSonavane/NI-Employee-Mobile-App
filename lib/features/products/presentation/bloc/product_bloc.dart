import 'package:employee_ni_service/features/products/data/models/response_assigned_employee_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator_dependecies.dart';
import '../../../profile/data/model/request_employee_profile.dart';
import '../../domain/usecases/fetch_emp_assigned_product_usecase.dart.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required FetchEmpAssignedProductUsecase fetchEmpAssignedProductUsecase,
  }) : super(ProductInitial()) {
    on<ProductEvent>((_, emit) => emit(ProductLoader()));
    on<GetAssignedProductList>(_onGetAssignedProduct);
  }

  void _onGetAssignedProduct(
    GetAssignedProductList event,
    Emitter<ProductState> emit,
  ) async {
    final res = await sl<FetchEmpAssignedProductUsecase>().call(
        params: RequestEmployeeProfile(
      employeeId: event.employeeId,
    ));

    res.fold(
      (failure) => emit(ProductFailure(failure.toString())),
      (success) => emit(ProductSuccess(success)),
    );
  }
}
