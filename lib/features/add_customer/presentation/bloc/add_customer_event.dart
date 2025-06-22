part of 'add_customer_bloc.dart';

@immutable
sealed class AddCustomerEvent {}

final class GetStatesEvent extends AddCustomerEvent {
  GetStatesEvent();
}

final class CreateCustomer extends AddCustomerEvent {
  final Map<String, dynamic> data;
  CreateCustomer({required this.data});
}
