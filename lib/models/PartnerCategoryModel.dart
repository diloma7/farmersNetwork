class PartnerCategoryModel {
  final String id;
  final String name;
  final String description;
  List<dynamic> partners;
  PartnerCategoryModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.partners});
  factory PartnerCategoryModel.fromJson(Map<String, dynamic> json) {
    return new PartnerCategoryModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        partners: json['partners']);
  }
}
