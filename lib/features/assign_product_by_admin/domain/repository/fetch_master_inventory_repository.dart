import 'package:dartz/dartz.dart';

abstract class FetchMasterInventoryRepository {
  Future<Either> getMasterInventory();
}
