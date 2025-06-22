class EntityCustomerProfile {
  final String code;
  final String message;
  final List<CustomerProfileData> data;

  EntityCustomerProfile({
    required this.code,
    required this.message,
    required this.data,
  });
}

class CustomerProfileData {
  final String? machineModel;
  final String? sId;
  final String? customerCode;
  final String? customerName;
  final String? city;
  final String? amcDue;
  final String? mobile;
  final String? email;
  final String? gstNo;
  final String? petrolMachineNumber;
  final String? dieselMachineNumber;
  final String? comboMachineNumber;
  final String? state;
  CustomerProfileData({
    required this.machineModel,
    required this.sId,
    required this.customerCode,
    required this.customerName,
    required this.city,
    required this.amcDue,
    required this.mobile,
    required this.email,
    required this.gstNo,
    required this.petrolMachineNumber,
    required this.dieselMachineNumber,
    required this.comboMachineNumber,
    required this.state,
  });
}
