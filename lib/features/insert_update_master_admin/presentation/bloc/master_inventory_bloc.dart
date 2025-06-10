import 'package:employee_ni_service/features/insert_update_master_admin/data/model/insert_update_product_model.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/response_insert_update_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
import '../../../assign_product_by_admin/data/models/model_master_inventory.dart';
import '../../../assign_product_by_admin/domain/usecases/fetch_master_inventory_usecase.dart';
import '../../domain/usecases/insert_update_product_usecase.dart';
part 'master_inventory_event.dart';
part 'master_inventory_state.dart';

class MasterInventoryBloc
    extends Bloc<MasterInventoryEvent, MasterInventoryState> {
  MasterInventoryBloc({
    required FetchMasterInventoryUsecase fetchMasterInventoryUsecase,
    required InsertUpdateProductUsecase insertUpdateProductUsecase,
  }) : super(MasterInventoryInitial()) {
    on<MasterInventoryEvent>((_, emit) => emit(MasterInventoryLoading()));
    on<GetAllMasterInventory>(_onGetAllMasterInventory);
    on<InsertUpdateMasterInventory>(_onInsertUpdateMasterInventory);
  }

  void _onGetAllMasterInventory(
    GetAllMasterInventory event,
    Emitter<MasterInventoryState> emit,
  ) async {
    final res = await sl<FetchMasterInventoryUsecase>().call();
    res.fold(
      (l) => emit(MasterInventoryFailure(l)),
      (r) => emit(MasterInventorySuccess<ModelMasterInventory>(r)),
    );
  }

  void _onInsertUpdateMasterInventory(
    InsertUpdateMasterInventory event,
    Emitter<MasterInventoryState> emit,
  ) async {
    final res = await sl<InsertUpdateProductUsecase>().call(
      params: event.insertUpdateProductModel,
    );
    res.fold(
      (l) => emit(MasterInventoryFailure(l)),
      (r) => emit(MasterInventorySuccess<ResponseInsertUpdateModel>(r)),
    );
  }
}
