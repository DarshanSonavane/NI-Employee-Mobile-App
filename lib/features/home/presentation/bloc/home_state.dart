part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeBlocInitial extends HomeState {}

final class HomeBlocLoader extends HomeState {}

final class HomeBlocSuccess extends HomeState {
  final ResponseHomeDetails homeDetails;
  HomeBlocSuccess(this.homeDetails);
}

final class HomeBlocFailure extends HomeState {
  final String error;
  HomeBlocFailure(this.error);
}
