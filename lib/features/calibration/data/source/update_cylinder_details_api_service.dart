import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_update_cylinder/request_update_cylinder_details.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../model/model_cylinder_details/response_cylinder_details.dart';

abstract class UpdateCylinderDetailsApiService {
  Future<Either> updateCylinderDetails(
      RequestUpdateCylinderDetails requestUpdateCylinderDetails);
}

class UpdateCylinderDetailsApiServiceImpl
    extends UpdateCylinderDetailsApiService {
  @override
  Future<Either> updateCylinderDetails(
      RequestUpdateCylinderDetails requestUpdateCylinderDetails) async {
    try {
      var response = await sl<DioClient>().post(ApiUrls.updateCylinderDetails,
          data: requestUpdateCylinderDetails.toMap());
      var getUpdatedCylinderDetailsResponse =
          ResponseCylinderDetails.fromMap(response.data);
      return Right(getUpdatedCylinderDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
