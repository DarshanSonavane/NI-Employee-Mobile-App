import 'package:dartz/dartz.dart';

abstract class FetchStatesRepository {
  Future<Either> fetchStates();
}
