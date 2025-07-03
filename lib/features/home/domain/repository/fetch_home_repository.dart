import 'package:dartz/dartz.dart';

abstract class FetchHomeRepository {
  Future<Either> getHomeDetails();
}

abstract class FetchLatestRewardRepository {
  Future<Either> getLatestReward();
}
