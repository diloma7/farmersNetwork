class Region {
  final String name;
  final String id;
  final String description;
  List<dynamic> serviceProviders;

  Region({required this.name,required this.id, required this.description, required this.serviceProviders});

  factory Region.fromJson(Map<String, dynamic> json) {
    return new Region(
        name: json['name'],id: json['id'], description: json['description'],serviceProviders:json['serviceProviders']);
  }
}

