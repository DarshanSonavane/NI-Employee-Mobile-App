part of 'add_customer_bloc.dart';

@immutable
sealed class AddCustomerEvent {}

final class GetStatesEvent extends AddCustomerEvent {
  GetStatesEvent();
}
