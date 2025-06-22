import 'package:employee_ni_service/features/add_customer/domain/entities/entity_state_list.dart';

class ModelStateList extends EntityStateList {
  ModelStateList({
    required super.code,
    required super.message,
    required super.data,
  });

  factory ModelStateList.fromJson(Map<String, dynamic> json) {
    return ModelStateList(
      code: json['code'],
      message: json['message'],
      data: json["data"] == null
          ? []
          : List<StateEntity>.from(
              json["data"]!.map(
                (x) => ModelStateEntity.fromJson(x),
              ),
            ),
    );
  }
}

class ModelStateEntity extends StateEntity {
  ModelStateEntity({
    required super.id,
    required super.code,
    required super.name,
  });

  factory ModelStateEntity.fromJson(Map<String, dynamic> json) {
    return ModelStateEntity(
      id: json['_id'] ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
