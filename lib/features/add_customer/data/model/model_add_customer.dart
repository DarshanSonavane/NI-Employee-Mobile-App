import 'package:employee_ni_service/features/add_customer/domain/entities/add_customer_entity.dart';

class ModelAddCustomer extends AddCustomerEntity {
  ModelAddCustomer({
    required super.customerCode,
    required super.customerName,
    required super.city,
    required super.amcDue,
    required super.mobileNumber,
    required super.email,
    required super.gstNumber,
    required super.customerId,
    required super.petrolMachineNumber,
    required super.dieselMachineNumber,
    required super.comboMachineNumber,
    required super.stateCode,
  });

  factory ModelAddCustomer.fromJson(Map<String, dynamic> json) {
    return ModelAddCustomer(
        customerCode: json['customerCode'] as String,
        customerName: json['customerName'] as String,
        city: json['city'] as String,
        amcDue: json['amcDue'] as String,
        mobileNumber: json['mobile'] as String,
        email: json['email'] as String,
        gstNumber: json['gstNo'] as String,
        customerId: json['customerId'] as String,
        petrolMachineNumber: json['petrolMachineNumber'] as String,
        dieselMachineNumber: json['dieselMachineNumber'] as String,
        comboMachineNumber: json['comboMachineNumber'] as String,
        stateCode: json['stateCode'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'customerName': customerName,
      'city': city,
      'amcDue': amcDue,
      'mobile': mobileNumber,
      'email': email,
      'gstNo': gstNumber,
      'customerId': customerId,
      'petrolMachineNumber': petrolMachineNumber,
      'dieselMachineNumber': dieselMachineNumber,
      'comboMachineNumber': comboMachineNumber,
      'stateCode': stateCode
    };
  }
}
