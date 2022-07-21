class Profiles {
  final String username;
  final String firstName;
  final String lastName;
  final String middleName;
  final String token;
  final String password;
  final String httpStatus;
  final String userType;
  final String email;
  final String phone;
  final String referenceCode;
  final String refereeCode;
  final String points;

  Profiles({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.token,
    required this.password,
    required this.httpStatus,
    required this.userType,
    required this.email,
    required this.phone,
    required this.referenceCode,
    required this.refereeCode,
    required this.points,
  });

  factory Profiles.fromJson(Map<String, dynamic> json) {
    return Profiles(
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      token: json['token'] as String,
      password: json['password'] as String,
      httpStatus: json['httpStatus'] as String,
      userType: json['userType'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      referenceCode: json['referenceCode'] as String,
      refereeCode: json['refereeCode'] as String,
      points: json['points'] as String,
    );
  }
  //profile to json for the purpose of sending data to server
  @override
  String toString() {
    return 'Profiles{username:$username,firstName:$firstName,lastName:$lastName, middleName: $middleName,token: $token,password: $password,httpStatus: $httpStatus,userType: $userType,email: $email,phone: $phone,referenceCode: $referenceCode,refereeCode: $refereeCode,points: $points}';
  }
}
