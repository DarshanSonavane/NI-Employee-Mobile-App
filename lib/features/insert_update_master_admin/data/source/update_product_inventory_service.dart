import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/insert_update_product_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../model/response_insert_update_model.dart';

abstract class UpdateProductsInventoryService {
  Future<Either> updateProduct(InsertUpdateProductModel params);
}

class UpdateProductsInventoryServiceImpl
    extends UpdateProductsInventoryService {
  @override
  Future<Either> updateProduct(InsertUpdateProductModel params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.insertUpdateMaster, data: params.toJson());
      var getUpdateInventoryResponse =
          ResponseInsertUpdateModel.fromJson(response.data);
      return Right(getUpdateInventoryResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
