part of 'fetch_appriciation_bloc.dart';

@immutable
sealed class FetchAppriciationEvent {}

class GetAllAppreciation extends FetchAppriciationEvent {
  GetAllAppreciation();
}
