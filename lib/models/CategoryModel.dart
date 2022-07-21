class CategoryModel {
  final String id;
  final String name;
  final String description;
  List<dynamic> serviceProviders;
  CategoryModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.serviceProviders});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return new CategoryModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        serviceProviders: json['serviceProviders']);
  }
}
