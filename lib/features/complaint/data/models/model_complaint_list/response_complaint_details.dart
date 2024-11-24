import 'package:employee_ni_service/features/complaint/domain/entities/complaint_list_entity/complaint_detail_entity.dart';

class ResponseComplaintDetails extends ComplaintDetailsEntity {
  ResponseComplaintDetails({
    required super.message,
    required super.data,
  });

  factory ResponseComplaintDetails.fromJson(Map<String, dynamic> json) {
    return ResponseComplaintDetails(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>).map((item) {
        return ServiceRequest(
          id: item['_id'] as String? ?? '',
          customerId: Customer(
            id: item['customerId']['_id'] as String? ?? '',
            customerCode: item['customerId']['customerCode'] as String? ?? '',
            customerName: item['customerId']['customerName'] as String? ?? '',
            city: item['customerId']['city'] as String? ?? '',
            email: item['customerId']['email'] as String? ?? '',
            gstNo: item['customerId']['gstNo'] as String? ?? '',
            mobile: item['customerId']['mobile'] as String? ?? '',
            amcDue: item['customerId']['amcDue'] as String? ?? '',
            password: item['customerId']['password'] as String? ?? '',
            comboMachineNumber:
                item['customerId']['comboMachineNumber'] as String? ?? '',
            dieselMachineNumber:
                item['customerId']['dieselMachineNumber'] as String? ?? '',
            petrolMachineNumber:
                item['customerId']['petrolMachineNumber'] as String? ?? '',
            stateCode: item['customerId']['stateCode'] as String? ?? '',
          ),
          machineType: item['machineType'] as String? ?? '',
          complaintType: item['complaintType'] != null
              ? ComplaintType(
                  id: item['complaintType']['_id'] as String? ?? '',
                  name: item['complaintType']['name'] as String? ?? '',
                )
              : ComplaintType(id: '', name: ''), // Provide default values
          status: item['status'] as String? ?? '',
          employeeFeedback: item['employeeFeedback'] as String? ?? '',
          assignedTo: item['assignedTo'] != null
              ? Employee(
                  id: item['assignedTo']['_id'] as String? ?? '',
                  firstName: item['assignedTo']['firstName'] as String? ?? '',
                  middleName: item['assignedTo']['middleName'] as String? ?? '',
                  lastName: item['assignedTo']['lastName'] as String? ?? '',
                  email: item['assignedTo']['email'] as String? ?? '',
                  phone: item['assignedTo']['phone'] as String? ?? '',
                  dob: item['assignedTo']['dob'] as String? ?? '',
                  employeeCode:
                      item['assignedTo']['employeeCode'] as String? ?? '',
                  role: item['assignedTo']['role'] as String? ?? '',
                  gender: item['assignedTo']['gender'] as String? ?? '',
                  createdAt: DateTime.parse(
                      item['assignedTo']['createdAt'] as String? ?? ''),
                  updatedAt: DateTime.parse(
                      item['assignedTo']['updatedAt'] as String? ?? ''),
                  password: item['assignedTo']['password'] as String? ?? '',
                  isActive: item['assignedTo']['isActive'] ==
                      "1", // Assuming '1' means true
                )
              : null,
          additionalReq: item['additionalReq'] as String?,
          createdAt: DateTime.parse(item['createdAt'] as String? ?? ''),
          updatedAt: DateTime.parse(item['updatedAt'] as String? ?? ''),
        );
      }).toList(),
    );
  }
}
