import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/domain/repository/fetch_master_inventory_repository.dart';
import '../../../../service_locator_dependecies.dart';
import '../source/get_master_inventory_source.dart';

class FetchMasterInventoryRepositoryImpl
    extends FetchMasterInventoryRepository {
  @override
  Future<Either> getMasterInventory() {
    return sl<GetMasterInventoryApiService>().getMasterInventory();
  }
}
