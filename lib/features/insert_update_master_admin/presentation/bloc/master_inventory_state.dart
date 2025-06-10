part of 'master_inventory_bloc.dart';

@immutable
sealed class MasterInventoryState {}

final class MasterInventoryInitial extends MasterInventoryState {}

final class MasterInventoryLoading extends MasterInventoryState {}

final class MasterInventorySuccess<T> extends MasterInventoryState {
  final T data;
  MasterInventorySuccess(this.data);
}

final class MasterInventoryFailure extends MasterInventoryState {
  final String message;
  MasterInventoryFailure(this.message);
}
