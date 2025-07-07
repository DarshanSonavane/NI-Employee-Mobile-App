part of 'add_customer_bloc.dart';

@immutable
sealed class AddCustomerState {}

final class AddCustomerInitial extends AddCustomerState {}

final class AddCustomerLoading extends AddCustomerState {}

final class FetchStateSuccess extends AddCustomerState {
  final ModelStateList modelStateList;
  FetchStateSuccess(this.modelStateList);
}

final class AddCustomerSuccess extends AddCustomerState {
  final String message;
  AddCustomerSuccess(this.message);
}

final class AddCustomerFailure extends AddCustomerState {
  final String message;

  AddCustomerFailure(this.message, {required String error});
}
