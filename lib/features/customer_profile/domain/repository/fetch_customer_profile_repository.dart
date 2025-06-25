import 'package:dartz/dartz.dart';

abstract class FetchCustomerProfileRepository {
  Future<Either> fetchCustomerRepository({int page = 1});
}
