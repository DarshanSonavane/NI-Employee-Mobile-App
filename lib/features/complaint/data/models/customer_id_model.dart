import '../../domain/entities/customer_id.dart';

class CustomerIdModel extends CustomerId {
  CustomerIdModel(
      {required super.machineModel,
      required super.sId,
      required super.customerCode,
      required super.customerName,
      required super.city,
      required super.email,
      required super.gstNo,
      required super.mobile,
      required super.amcDue,
      required super.password,
      required super.comboMachineNumber,
      required super.dieselMachineNumber,
      required super.petrolMachineNumber,
      required super.stateCode});

  factory CustomerIdModel.fromJson(Map<String, dynamic> json) {
    return CustomerIdModel(
      machineModel: json['machineModel'],
      sId: json['_id'],
      customerCode: json['customerCode'],
      customerName: json['customerName'],
      city: json['city'],
      email: json['email'],
      gstNo: json['gstNo'],
      mobile: json['mobile'],
      amcDue: json['amcDue'],
      password: json['password'],
      comboMachineNumber: json['comboMachineNumber'],
      dieselMachineNumber: json['dieselMachineNumber'],
      petrolMachineNumber: json['petrolMachineNumber'],
      stateCode: json['stateCode'],
    );
  }
}
