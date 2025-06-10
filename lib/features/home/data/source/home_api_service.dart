import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetHomeDetailsApiService {
  Future<Either> getHomeDetails();
}

class GetHomeDetailsApiServiceImpl extends GetHomeDetailsApiService {
  @override
  Future<Either> getHomeDetails() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getHomeDetails);
      var getHomeDetailsResponse = ResponseHomeDetails.fromJson(response.data);

      return Right(getHomeDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
