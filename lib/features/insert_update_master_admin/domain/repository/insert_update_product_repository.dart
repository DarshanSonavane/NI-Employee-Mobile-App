import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/insert_update_product_model.dart';

abstract class InsertUpdateProductRepository {
  Future<Either> updateProductsInventory(InsertUpdateProductModel params);
}
