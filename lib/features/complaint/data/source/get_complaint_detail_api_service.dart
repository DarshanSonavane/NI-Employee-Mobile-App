import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../models/model_complaint_list/response_complaint_details.dart';

abstract class GetComplaintDetailApiService {
  Future<Either> getComplaintDetails();
}

class GetComplaintDetailsApiServiceImpl extends GetComplaintDetailApiService {
  @override
  Future<Either> getComplaintDetails() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getComplaintDetails);
      var getComplaintDetailsResponse =
          ResponseComplaintDetails.fromJson(response.data);
      return Right(getComplaintDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
