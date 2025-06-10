import 'package:employee_ni_service/features/auth/domain/entities/user.dart';

class LoginRequestParams extends User {
  LoginRequestParams({
    required super.customerCode,
    required super.type,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': customerCode,
      'type': type,
      'password': password,
    };
  }
}
