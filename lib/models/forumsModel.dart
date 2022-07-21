class ForumModel {
  final String title;
  final String description;


  ForumModel({
    required this.title,
    required this.description,

  });

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(
      title: json['title'],
      description: json['description'],

    );
  }
}
