import 'package:dartz/dartz.dart';

abstract class FetchComplaintRepository {
  Future<Either> getComplaintDetails();
}
