import 'entity.dart';

enum UserProfile {
  admin,
  sales,
  manager;
}

base class UserEntity extends Entity {
  final String name;
  final UserProfile profile;

  UserEntity({required super.id, required this.name, required this.profile});
}
