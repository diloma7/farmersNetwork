class ReportModel{
  String Id;
  Reports reports;

  ReportModel({
    required this.Id,
    required this.reports
  });

  factory ReportModel.fromJson(Map<String, dynamic> parsedJson){
    return ReportModel(
        Id: parsedJson['Id'],
        reports: Reports.fromJson(parsedJson['reports'])
    );
  }
}

class Reports{
  String name;
  String categoryId;
  double amount;

  Reports({
    required this.name,
    required this.categoryId,
    required this.amount
  });

  factory Reports.fromJson(Map<String, dynamic> json){
    return Reports(
        categoryId: json['id'],
        name: json['name'],
        amount: json['amount']
    );
  }
}