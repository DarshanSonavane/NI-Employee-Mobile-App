import '../../../domain/entities/complaint_list_entity/complaint_type.dart';

class ComplaintTypeModel extends ComplaintType {
  ComplaintTypeModel({
    required super.sId,
    required super.name,
  });

  factory ComplaintTypeModel.fromJson(Map<String, dynamic> json) {
    return ComplaintTypeModel(
      sId: json['_id'],
      name: json['name'],
    );
  }
}
