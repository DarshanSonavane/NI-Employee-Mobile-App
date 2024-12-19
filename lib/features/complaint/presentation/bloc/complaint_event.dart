part of 'complaint_bloc.dart';

@immutable
sealed class ComplaintEvent {}

final class GetAllComplaintList extends ComplaintEvent {
  final String complaintType;
  GetAllComplaintList({required this.complaintType});
}

final class GetAllEmployeesList extends ComplaintEvent {
  final String complaintId;
  GetAllEmployeesList(this.complaintId);
}

final class CloseComplaintsItem extends ComplaintEvent {
  final String complaintId;
  final String? employeeId;
  final String source;
  CloseComplaintsItem({
    required this.complaintId,
    required this.employeeId,
    required this.source,
  });
}
