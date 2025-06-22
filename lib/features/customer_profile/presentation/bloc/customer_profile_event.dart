part of 'customer_profile_bloc.dart';

@immutable
sealed class CustomerProfileEvent {}

final class GetAllCustomers extends CustomerProfileEvent {
  GetAllCustomers();
}

class DeleteCustomerEvent extends CustomerProfileEvent {
  final String customerId;

  DeleteCustomerEvent({required this.customerId});
}
