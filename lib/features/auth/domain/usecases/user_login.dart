import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/auth/data/models/login_request_params.dart';
import 'package:employee_ni_service/features/auth/domain/repository/login_repository.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';

class UserLogin implements UseCase<Either, LoginRequestParams> {
  @override
  Future<Either> call({LoginRequestParams? params}) async {
    return sl<LoginRepository>().loginWithEmailPassword(params!);
  }
}
