import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_employee_complaint/employee_complaint_model.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../models/model_complaint_list/response_complaint_details.dart';

abstract class GetComplaintDetailApiService {
  Future<Either> getComplaintDetails(ParamsAsType? params);
}

class GetComplaintDetailsApiServiceImpl extends GetComplaintDetailApiService {
  final hiveStorageService = sl<HiveStorageService>();

  @override
  Future<Either> getComplaintDetails(ParamsAsType? params) async {
    final hiveUser = hiveStorageService.getUser();
    late String apiUrl;
    Map<String, dynamic>? queryParams;

    if (hiveUser?.role != '0') {
      apiUrl = ApiUrls.getAssignedComplaint;
      if (hiveUser?.id != null) {
        queryParams = {
          Constants.employeeId: hiveUser!.id,
        };
      }
    } else {
      apiUrl = params?.typeOfData == Constants.activeComplaints
          ? ApiUrls.getActiveComplaintDetails
          : ApiUrls.getClosedComplaintDetails;
    }
    try {
      var response =
          await sl<DioClient>().get(apiUrl, queryParameters: queryParams);
      late Object getComplaintDetailsResponse;
      if (hiveUser?.role != '0') {
        getComplaintDetailsResponse =
            EmployeeComplaintModel.fromMap(response.data);
      } else {
        getComplaintDetailsResponse =
            ResponseComplaintDetails.fromJson(response.data);
      }

      return Right(getComplaintDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
