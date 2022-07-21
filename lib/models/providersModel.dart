class ProvidersModel {
  final String name;
  final String id;
  final String description;


  ProvidersModel({required this.name,required this.id, required this.description});

  factory ProvidersModel.fromJson(Map<String, dynamic> json) {
    return new ProvidersModel(
        name: json['name'],id: json['id'], description: json['description']);
  }
}

