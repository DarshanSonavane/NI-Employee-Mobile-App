part of 'customer_profile_bloc.dart';

@immutable
sealed class CustomerProfileState {}

final class CustomerProfileInitial extends CustomerProfileState {}

final class CustomerProfileLoading extends CustomerProfileState {}

final class CustomerProfileSuccess extends CustomerProfileState {
  final ModelCustomerProfile customerProfile;
  CustomerProfileSuccess(this.customerProfile);
}

final class CustomerProfileFailure extends CustomerProfileState {
  final String errorMessage;

  CustomerProfileFailure(this.errorMessage, {required String error});
}
