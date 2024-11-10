import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/auth/data/source/login_api_service.dart';
import 'package:employee_ni_service/features/auth/domain/repository/login_repository.dart';
import 'package:flutter/material.dart';
import '../../../../service_locator_dependecies.dart';
import '../models/login_request_params.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Either> loginWithEmailPassword(LoginRequestParams loginReq) {
    debugPrint("LOGINREQ ${loginReq.customerCode}");
    return sl<LoginApiService>().loginWithEmailPassword(loginReq);
  }
}
