class CustomerId {
  String? sId;
  String? customerCode;
  String? customerName;
  String? city;
  String? amcDue;
  String? mobile;
  String? email;
  String? gstNo;
  String? password;
  String? petrolMachineNumber;
  String? dieselMachineNumber;
  String? comboMachineNumber;
  String? stateCode;
  String? machineModel;
  int? iV;
  CustomerId({
    required this.sId,
    required this.customerCode,
    required this.customerName,
    required this.city,
    required this.amcDue,
    required this.mobile,
    required this.email,
    required this.gstNo,
    required this.password,
    required this.petrolMachineNumber,
    required this.dieselMachineNumber,
    required this.comboMachineNumber,
    required this.stateCode,
    required this.machineModel,
    required this.iV,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'customerCode': customerCode,
      'customerName': customerName,
      'city': city,
      'amcDue': amcDue,
      'mobile': mobile,
      'email': email,
      'gstNo': gstNo,
      'password': password,
      'petrolMachineNumber': petrolMachineNumber,
      'dieselMachineNumber': dieselMachineNumber,
      'comboMachineNumber': comboMachineNumber,
      'stateCode': stateCode,
      'machineModel': machineModel,
      'iV': iV,
    };
  }
}
