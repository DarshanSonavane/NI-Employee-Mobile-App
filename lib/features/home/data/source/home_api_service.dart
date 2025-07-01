import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:employee_ni_service/features/home/data/model/response_latest_reward_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetHomeDetailsApiService {
  Future<Either> getHomeDetails();
}

abstract class GetLatestRewardApiService {
  Future<Either> getLatestRewardDetails();
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

class GetLatestRewardApiServiceImpl extends GetLatestRewardApiService {
  @override
  Future<Either<DioException, ResponseLatestRewardModel>>
      getLatestRewardDetails() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getLatestReward);
      var getLatestRewardResponse =
          ResponseLatestRewardModel.fromJson(response.data);
      return Right(getLatestRewardResponse);
    } on DioException catch (e) {
      return left(e);
    }
  }
}
