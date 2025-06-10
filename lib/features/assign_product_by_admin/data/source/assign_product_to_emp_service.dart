import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/response_assigned_product_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../models/product_assignment_model.dart';

abstract class AssignProductToEmpService {
  Future<Either> assignedProd(ProductAssignmentModel productAssignmentModel);
}

class AssignProductToEmpServiceImpl extends AssignProductToEmpService {
  @override
  Future<Either> assignedProd(
      ProductAssignmentModel productAssignmentModel) async {
    try {
      var response = await sl<DioClient>().post(ApiUrls.assignedProductToEmp,
          data: productAssignmentModel.toJson());
      var responseAssignedProduct =
          ResponseAssignedProductModel.fromJson(response.data);
      return Right(responseAssignedProduct);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
