import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/insert_update_product_model.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/insert_update_product_repository.dart';

class InsertUpdateProductUsecase
    implements UseCase<Either, InsertUpdateProductModel> {
  @override
  Future<Either> call({InsertUpdateProductModel? params}) {
    return sl<InsertUpdateProductRepository>().updateProductsInventory(params!);
  }
}
