class EntityStateList {
  final String code;
  final String message;
  final List<StateEntity> data;

  EntityStateList({
    required this.code,
    required this.message,
    required this.data,
  });
}

class StateEntity {
  final String? id;
  final String? code;
  final String? name;
  StateEntity({
    required this.id,
    required this.code,
    required this.name,
  });
}
