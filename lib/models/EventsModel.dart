class EventsModel {
  String subject;
  String startDate;
  //String endDate;
  String startTime;
  String endTime;
  String comment;

  EventsModel(
      {required this.subject,
      required this.startDate,
      required this.startTime,
      required this.endTime,
      required this.comment});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      subject: json['subject'],
      startDate: json['startDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      comment: json['comment'],
    );
  }
}
