class ReportModel {
  String? id;
  String? amount;

  ReportModel({
    this.id,
    this.amount,
  });

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    amount = json['amount'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['amount'] = amount;
    return json;
  }
}