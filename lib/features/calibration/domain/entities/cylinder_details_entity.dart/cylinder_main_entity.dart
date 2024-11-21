import 'cylinder_data.dart';

class CylinderMainEntity {
  String? code;
  String? message;
  List<CylinderData>? cylinderData;
  CylinderMainEntity({
    required this.code,
    required this.message,
    required this.cylinderData,
  });
}
