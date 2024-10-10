import 'package:employee_ni_service/features/set_reset_password/domain/entities/set_reset_password_entity.dart';

class SetResetPassRequestParams extends SetResetPasswordEntity {
  SetResetPassRequestParams({
    required super.customerCode,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerCode': customerCode,
      'password': password,
    };
  }
}
