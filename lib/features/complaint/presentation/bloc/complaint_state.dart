part of 'complaint_bloc.dart';

@immutable
sealed class ComplaintState {}

final class ComplaintInitial extends ComplaintState {}

final class ComplaintLoader extends ComplaintState {}

final class ComplaintSuccess<T> extends ComplaintState {
  final T data;
  final String? complaintId;
  final String? source;
  ComplaintSuccess(this.data, {this.complaintId, this.source});
}

final class ComplaintFailure extends ComplaintState {
  final String errorMessage;
  ComplaintFailure(this.errorMessage);
}
