part of 'customer_profile_bloc.dart';

@immutable
sealed class CustomerProfileEvent {}

final class GetAllCustomers extends CustomerProfileEvent {
  final int page;
  GetAllCustomers({this.page = 1});
}

class DeleteCustomerEvent extends CustomerProfileEvent {
  final String customerId;

  DeleteCustomerEvent({required this.customerId});
}

final class SearchCustomers extends CustomerProfileEvent {
  final String query;

  SearchCustomers({required this.query});
}
