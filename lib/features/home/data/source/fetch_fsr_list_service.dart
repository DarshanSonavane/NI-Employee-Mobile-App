import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../model/request_fsr_model.dart';

abstract class FetchFsrListService {
  Future<Either<String, ResponseFsrModel>> fetchFSRList(RequestFsrModel params,
      {int? page});
}

class FetchFsrListServiceImpl extends FetchFsrListService {
  @override
  Future<Either<String, ResponseFsrModel>> fetchFSRList(RequestFsrModel params,
      {int? page}) async {
    try {
      final baseUrl = params.type == Constants.showLatestFSR
          ? ApiUrls.getFSRListLatest
          : ApiUrls.getFSRList;
      final url = page != null ? "$baseUrl?page=$page" : baseUrl;
      final response = await sl<DioClient>().post(
        url,
        data: params.toJson(),
      );
      var getFSRListData =
          ResponseFsrModel.fromJson(response.data, params.type!);
      return Right(getFSRListData);
    } on DioException catch (e) {
      return Left(e.message ?? Constants.somethingWentWrong);
    }
  }
}
