class ServiceProviderModel {
  final String id;
  final String name;
  final String description;
  ServiceProviderModel(
      {required this.id, required this.name, required this.description});
  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return new ServiceProviderModel(
        id: json['id'], name: json['name'], description: json['description']);
  }
}
