import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/appreciation_profile/data/model/model_all_appreciation_response.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class GetAllAppreciationService {
  Future<Either> getAllAppreciation();
}

class GetAllAppreciationServiceImpl extends GetAllAppreciationService {
  @override
  Future<Either> getAllAppreciation() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.fetchAllAppreciation);
      var responseAppreciationList =
          ModelAllAppreciationResponse.fromJson(response.data);
      return Right(responseAppreciationList);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
