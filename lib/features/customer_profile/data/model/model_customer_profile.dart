import 'package:employee_ni_service/features/customer_profile/domain/entities/entity_customer_profile.dart';

class ModelCustomerProfile extends EntityCustomerProfile {
  ModelCustomerProfile({
    required super.code,
    required super.message,
    required super.data,
  });

  factory ModelCustomerProfile.fromJson(Map<String, dynamic> json) {
    return ModelCustomerProfile(
      code: json["code"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<CustomerProfileData>.from(
              json["data"]!.map(
                (x) => ModelCustomerProfileData.fromJson(x),
              ),
            ),
    );
  }
}

class ModelCustomerProfileData extends CustomerProfileData {
  ModelCustomerProfileData(
      {required super.machineModel,
      required super.sId,
      required super.customerCode,
      required super.customerName,
      required super.city,
      required super.amcDue,
      required super.mobile,
      required super.email,
      required super.gstNo,
      required super.petrolMachineNumber,
      required super.dieselMachineNumber,
      required super.comboMachineNumber,
      required super.state});

  factory ModelCustomerProfileData.fromJson(Map<String, dynamic> json) {
    return ModelCustomerProfileData(
      machineModel: json["machineModel"] ?? "",
      sId: json["_id"] ?? "",
      customerCode: json["customerCode"] ?? "",
      customerName: json["customerName"] ?? "",
      city: json["city"] ?? "",
      amcDue: json["amcDue"] ?? "",
      mobile: json["mobile"] ?? "",
      email: json["email"] ?? "",
      gstNo: json["gstNo"] ?? "",
      petrolMachineNumber: json["petrolMachineNumber"] ?? "",
      dieselMachineNumber: json["dieselMachineNumber"] ?? "",
      comboMachineNumber: json["comboMachineNumber"] ?? "",
      state: json["state"] ?? "",
    );
  }
}
