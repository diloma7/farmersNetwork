class PartnerModel {
  final String id;
  final String name;
  final String description;
  PartnerModel(
      {required this.id, required this.name, required this.description});
  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return new PartnerModel(
        id: json['id'], name: json['name'], description: json['description']);
  }
}
