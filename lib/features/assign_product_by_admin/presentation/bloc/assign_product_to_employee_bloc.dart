import 'package:employee_ni_service/features/assign_product_by_admin/data/models/model_master_inventory.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/product_assignment_model.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/domain/usecases/assign_product_to_emp_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
import '../../../complaint/data/models/model_fetch_employee/response_employee_model.dart';
import '../../../complaint/domain/usecases/fetch_employee_data.dart';
import '../../data/models/response_assigned_product_model.dart';
import '../../domain/usecases/fetch_master_inventory_usecase.dart';

part 'assign_product_to_employee_event.dart';
part 'assign_product_to_employee_state.dart';

class AssignProductToEmployeeBloc
    extends Bloc<AssignProductToEmployeeEvent, AssignProductToEmployeeState> {
  AssignProductToEmployeeBloc({
    required FetchMasterInventoryUsecase fetchMasterInventoryUsecase,
    required FetchEmployeeData fetchEmployeeData,
    required AssignProductToEmpUsecase assignProductToEmpUseCase,
  }) : super(AssignProductToEmployeeInitial()) {
    on<AssignProductToEmployeeEvent>(
        (_, emit) => emit(AssignProductToEmployeeLoading()));
    on<GetAllMasterInventory>(_onGetAllMasterInventory);
    on<GetAllEmployeesList>(_onFetchEmployeeDetails);
    on<AssignProductToEmployee>(_onAssignProductToEmployee);
  }

  void _onGetAllMasterInventory(
    GetAllMasterInventory event,
    Emitter<AssignProductToEmployeeState> emit,
  ) async {
    final res = await sl<FetchMasterInventoryUsecase>().call();
    res.fold(
      (l) => emit(AssignProductToEmployeeFailure(l)),
      (r) => emit(AssignProductToEmployeeSuccess<ModelMasterInventory>(r)),
    );
  }

  void _onFetchEmployeeDetails(
    GetAllEmployeesList event,
    Emitter<AssignProductToEmployeeState> emit,
  ) async {
    final res = await sl<FetchEmployeeData>().call();
    res.fold(
      (l) => emit(AssignProductToEmployeeFailure(l)),
      (r) => emit(
        AssignProductToEmployeeSuccess<ResponseEmployeeModel>(r),
      ),
    );
  }

  void _onAssignProductToEmployee(
    AssignProductToEmployee event,
    Emitter<AssignProductToEmployeeState> emit,
  ) async {
    final res = await sl<AssignProductToEmpUsecase>().call(
      params: event.productAssignment,
    );
    res.fold(
      (l) => emit(AssignProductToEmployeeFailure(l)),
      (r) => emit(
        AssignProductToEmployeeSuccess<ResponseAssignedProductModel>(r),
      ),
    );
  }
}
