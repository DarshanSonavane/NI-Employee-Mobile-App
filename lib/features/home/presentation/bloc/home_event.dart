part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class GetAllHomeDetails extends HomeEvent {}

final class GetFSRList extends HomeEvent {
  final String employeeId;
  final String role;
  final String type;
  final int? page;
  GetFSRList({
    required this.employeeId,
    required this.role,
    required this.type,
    this.page,
  });
}
