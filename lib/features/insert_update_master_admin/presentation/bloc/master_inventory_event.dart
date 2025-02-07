part of 'master_inventory_bloc.dart';

@immutable
sealed class MasterInventoryEvent {}

final class GetAllMasterInventory extends MasterInventoryEvent {}

final class InsertUpdateMasterInventory extends MasterInventoryEvent {
  final InsertUpdateProductModel insertUpdateProductModel;
  InsertUpdateMasterInventory(this.insertUpdateProductModel);
}
