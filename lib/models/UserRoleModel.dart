class UserRoleModel {
  final int id;
  final String name;

  UserRoleModel({required this.id, required this.name});
  factory UserRoleModel.fromJson(Map<String, dynamic> json) {
    return new UserRoleModel(id: json['id'], name: json['name']);
  }
}
