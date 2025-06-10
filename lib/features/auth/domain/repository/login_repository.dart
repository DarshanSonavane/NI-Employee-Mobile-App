import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/auth/data/models/login_request_params.dart';

abstract class LoginRepository {
  Future<Either> loginWithEmailPassword(LoginRequestParams loginReq);
}
