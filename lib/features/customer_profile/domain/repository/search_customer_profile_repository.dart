import 'package:dartz/dartz.dart';

abstract class SearchCustomerProfileRepository {
  Future<Either> searchCustomerRepository(String query);
}
