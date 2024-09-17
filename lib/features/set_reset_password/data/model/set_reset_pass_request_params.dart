class SetResetPassRequestParams {
  final String customerCode;
  final String password;

  SetResetPassRequestParams({
    required this.customerCode,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerCode': customerCode,
      'password': password,
    };
  }
}
