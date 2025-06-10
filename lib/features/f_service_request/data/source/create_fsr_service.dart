import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../model/request_create_fsr_model.dart';
import '../model/response_verification_model.dart';

abstract class CreateFSRService {
  Future<Either> createFSRRequest(RequestCreateFSRModel params);
}

class CreateFSRServiceImpl extends CreateFSRService {
  @override
  Future<Either> createFSRRequest(RequestCreateFSRModel params) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrls.createFSR, data: params.toJson());
      var getFSRCreateResponse =
          ResponseVerificationModel.fromJson(response.data);
      return Right(getFSRCreateResponse);
    } on DioException catch (e) {
      return Left(e.response?.data ?? e.message);
    }
  }
}
