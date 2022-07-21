class UserTypes {
  final String name;


  UserTypes({
    required this.name,

  });

  factory UserTypes.fromJson(Map<String, dynamic> json) {
    return UserTypes(
      name: json['name'],

    );
  }
}
