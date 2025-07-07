part of 'fetch_appriciation_bloc.dart';

@immutable
sealed class FetchAppriciationState {}

final class FetchAppriciationInitial extends FetchAppriciationState {}

final class FetchAppriciationLoading extends FetchAppriciationState {}

final class FetchAppreciationSuccess extends FetchAppriciationState {
  final ModelAllAppreciationResponse modelAllAppreciationResponse;
  FetchAppreciationSuccess(this.modelAllAppreciationResponse);
}

final class FetchAppreciationFailure extends FetchAppriciationState {
  final String message;
  FetchAppreciationFailure(this.message);
}
