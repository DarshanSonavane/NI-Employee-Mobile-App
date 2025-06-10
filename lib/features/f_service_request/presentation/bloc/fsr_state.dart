part of 'fsr_bloc.dart';

@immutable
sealed class FsrState {}

final class FsrInitial extends FsrState {}

final class FsrLoader extends FsrState {}

final class FsrSuccess<T> extends FsrState {
  final T data;
  final String type;
  FsrSuccess(this.data, this.type);
}

final class FsrFailure extends FsrState {
  final String message;
  FsrFailure(this.message);
}
