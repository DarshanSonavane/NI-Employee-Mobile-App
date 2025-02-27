import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../model/request_fsr_model.dart';

abstract class FetchFsrListService {
  Future<Either> fetchFSRList(RequestFsrModel params);
}

class FetchFsrListServiceImpl extends FetchFsrListService {
  @override
  Future<Either> fetchFSRList(RequestFsrModel params) async {
    try {
      debugPrint("Params ${params.employeeId}");
      var response =
          await sl<DioClient>().post(ApiUrls.getFSRList, data: params);
      var getFSRListData = ResponseFsrModel.fromJson(response.data);
      return Right(getFSRListData);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
