class LoginRequestParams {
  final String customerCode;
  final String type;
  final String password;

  LoginRequestParams({
    required this.customerCode,
    required this.type,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': customerCode,
      'type': type,
      'password': password,
    };
  }
}
