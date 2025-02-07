import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/insert_update_product_model.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/domain/repository/insert_update_product_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/update_product_inventory_service.dart';

class InsertUpdateProductRepositoryImpl extends InsertUpdateProductRepository {
  @override
  Future<Either> updateProductsInventory(InsertUpdateProductModel params) {
    return sl<UpdateProductsInventoryService>().updateProduct(params);
  }
}
