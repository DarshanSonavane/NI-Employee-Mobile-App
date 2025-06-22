part of 'add_customer_bloc.dart';

@immutable
sealed class AddCustomerState {}

final class AddCustomerInitial extends AddCustomerState {}

final class AddCustomerLoading extends AddCustomerState {}

final class AddCustomerSuccess extends AddCustomerState {
  final ModelStateList modelStateList;
  AddCustomerSuccess(this.modelStateList);
}

final class AddCustomerFailure extends AddCustomerState {
  final String message;

  AddCustomerFailure(this.message, {required String error});
}
