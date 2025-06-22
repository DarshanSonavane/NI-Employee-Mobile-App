import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/add_customer/data/model/model_state_list.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../service_locator_dependecies.dart';

abstract class FetchStatesService {
  Future<Either> fetchStates();
}

class FetchStatesServiceImpl implements FetchStatesService {
  @override
  Future<Either> fetchStates() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getAllStates);
      var responseStateList = ModelStateList.fromJson(response.data);
      return Right(responseStateList);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
