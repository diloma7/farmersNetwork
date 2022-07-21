class ServiceProviderCategoryModel {
  final String id;
  final String name;
  final String description;
  List<dynamic> serviceProviders;
  ServiceProviderCategoryModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.serviceProviders});
  factory ServiceProviderCategoryModel.fromJson(Map<String, dynamic> json) {
    return new ServiceProviderCategoryModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        serviceProviders: json['serviceProviders']);
  }
}
