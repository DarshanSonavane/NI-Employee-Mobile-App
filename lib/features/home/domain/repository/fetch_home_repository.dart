import 'package:dartz/dartz.dart';

abstract class FetchHomeRepository {
  Future<Either> getHomeDetails();
}
