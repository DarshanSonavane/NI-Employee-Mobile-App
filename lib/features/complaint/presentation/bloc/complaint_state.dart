part of 'complaint_bloc.dart';

@immutable
sealed class ComplaintState {}

final class ComplaintInitial extends ComplaintState {}

final class ComplaintLoader extends ComplaintState {}

final class ComplaintSuccess extends ComplaintState {
  final ResponseComplaintDetails complaintDetails;
  ComplaintSuccess(this.complaintDetails);
}

final class ComplaintFailure extends ComplaintState {
  final String errorMessage;
  ComplaintFailure(this.errorMessage);
}
