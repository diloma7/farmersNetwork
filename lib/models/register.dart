class regUsers {
  final String firstName;
  final String lastName;
  final String middleName;
  final String gender;
  final String email;
  final String phone;
  final String userType;
  final String residentialAddress;
  final String physicalAddress;
  final String password;

  regUsers({ required this.password,required this.firstName,required this.lastName,required this.middleName,required this.gender,required this.email,required this.phone,required this.userType,required this.residentialAddress,required this.physicalAddress});

  factory regUsers.fromJson(Map<String, dynamic> json) {
    return regUsers(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      userType: json['userType'] as String,
      residentialAddress: json['residentialAddress'] as String,
      physicalAddress: json['physicalAddress'] as String,
      password: json['password'] as String,
    );
  }
  //profile to json for the purpose of sending data to server
  @override
  String toString() {
    return 'regUsers{ firstName: $password,firstName: $firstName,lastName: $lastName,middleName: $middleName,gender: $gender,email: $email,phone: $phone,userType: $userType,residentialAddress: $residentialAddress,physicalAddress: $physicalAddress}';
  }
}