part of 'complaint_bloc.dart';

@immutable
sealed class ComplaintEvent {}

final class GetAllComplaintList extends ComplaintEvent {}
