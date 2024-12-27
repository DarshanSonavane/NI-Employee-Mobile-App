part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoader extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ResponseEmployeeProfile responseEmployeeProfile;
  ProfileSuccess(this.responseEmployeeProfile);
}

final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure(this.message);
}
