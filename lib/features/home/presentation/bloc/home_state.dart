part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeBlocInitial extends HomeState {}

final class HomeBlocLoader extends HomeState {}

final class HomeBlocSuccess<T> extends HomeState {
  final T data;
  HomeBlocSuccess(this.data);
}

final class HomeBlocFailure extends HomeState {
  final String error;
  HomeBlocFailure(this.error);
}
