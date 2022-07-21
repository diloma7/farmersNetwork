import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/models/CategoryModel.dart';
import 'package:farmers_network/models/PartnerCategoryModel.dart';
import 'package:farmers_network/models/PartnerModel.dart';
import 'package:farmers_network/models/ServiceProviderCategoryModel.dart';
import 'package:farmers_network/models/ServiceProviderModel.dart';
import 'package:farmers_network/models/UserRoleModel.dart';
import 'package:farmers_network/models/UserTypes.dart';
import 'package:farmers_network/pages/AdjustedPages/AdjustedLogin.dart';
import 'package:farmers_network/pages/LoginPage.dart';
import 'package:farmers_network/pages/term_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:http/http.dart' as http;

import 'DialogPolicy.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    super.initState();
    //fetch service provider categories
    getData(SERVICE_PROVIDER_CATEGORIES).whenComplete(() {
      setState(() {});
      _loadData(SERVICE_PROVIDER_CATEGORIES);
    });
    //fetch partner categories
    getData(PARTNER_CATEGORIES).whenComplete(() {
      setState(() {});
      _loadData(PARTNER_CATEGORIES);
    });
    getData(USER_ROLES).whenComplete(() {
      setState(() {});
      _loadData(USER_ROLES);
    });
  }

  var bbb;
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController yob = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownvalue = 'Select UserType';

  String dropDownServiceProviderCategories = 'select service Provider category';
  String dropDownPartnerCategory = 'Select partner cartegory';
  String dropDownPartners = 'Select partner';
  String dropDownServiceProviders = 'Select service provider';
  String dServiceProviderCategory = '';

  String data = '';

  var jsonObj;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? verificationCode;
  String? pincode;
  String? middleName;
  String? lastName;
  String? phone;

  var userTypes = [
    'Select UserType',
    'Farmer',
    'Services Provider',
    'Partner',
  ];

  late UserTypes selectedUserType;

  String userRoles = '';
  String serviceProviderCategories = '';
  String partnerCategories = '';

  var serviceProviderOptions = [];
  var partnerOptions = [];

  String selectedUserRole = '';
  String selectedServiceProviderCategory = '';
  String selectedServiceProvider = '';

  String selectedPartnerCategory = '';
  String selectedPartner = '';

  List<CategoryModel> categoryModelList1 = [];
  List<ServiceProviderCategoryModel> serviceProviderCategoryList = [];
  List<PartnerCategoryModel> partnerCategoryList = [];
  List<ServiceProviderModel> serviceProviderModelList = [];
  List<PartnerModel> partnerModelList = [];
  List<UserRoleModel> userRoleList = [];

  int switchVal = 0;
  int switchVal1 = 0;
  int switchValPartnerCategories = 0;
  int switchValPartners = 0;

  getData(String endPoint) async {
    print(endPoint);
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      setState(() {
        if (endPoint == SERVICE_PROVIDER_CATEGORIES) {
          serviceProviderCategories = response.body;
        } else if (endPoint == PARTNER_CATEGORIES) {
          partnerCategories = response.body;
        } else if (endPoint == USER_ROLES) {
          userRoles = response.body;
        }
      });

      //return response.body;
    } else {
      print('sifiki');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to load Service Providers!'),
          action: SnackBarAction(
            label: 'Retry Again',
            onPressed: () {
              // Code to print(partnerCategories);(partnerCategories);ute.
            },
          ),
        ),
      );
    }
  }

  //send data to api
  registerUser(
      String firstName,
      String middleName,
      String lastName,
      String gender,
      String email,
      String phone,
      String userType,
      String physicalAddress,
      String residentialAddress,
      selectedUserRole,
      selectedPartner,
      selectedServiceProvider) async {
    final response = await http.post(
      Uri.parse(REGISTRATION),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'gender': gender,
        'email': email,
        'phone': phone,
        'userType': userType,
        'physicalAddress': physicalAddress,
        'residentialAddress': residentialAddress,
        "userRoleId": selectedUserRole,
        'partnerId': userType == 'partner' && userType != 'Farmer'
            ? selectedPartner
            : '',
        'serviceProviderId': userType != 'partner' && userType != 'Farmer'
            ? selectedServiceProvider
            : ''
      }),
    );

    if (response.statusCode == 200) {
      jsonObj = response;
      _displayDialog(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Username or Password Not Ok!'),
          action: SnackBarAction(
            label: 'Enter Again',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }

  //call dialogue
  _displayDialog(BuildContext context) async {
    // print(jsonObj);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter OTP Code'),
            content: OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 50,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17),
              onChanged: (pin) {
                print("Changed: " + pincode!);
              },
              onCompleted: (pin) {
                pincode = pin;
                verifyUser(
                    pincode.toString(),
                    phone.toString(),
                    firstnameController.text,
                    lastnameController.text,
                    dropdownvalue.toString(),
                    phone.toString(),
                    emailController.text,
                    selectedUserRole,
                    selectedPartner,
                    selectedServiceProvider);
              },
            ),
          );
        });
  }

//Verify USer
  verifyUser(
      String verificationCode,
      String username,
      String firstName,
      String lastName,
      String userType,
      String phone,
      String email,
      selectedUserRole,
      selectedPartner,
      selectedServiceProvider) async {
    final response = await http.post(
      Uri.parse(VERIFY),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'verificationCode': verificationCode,
        'username': username,
        'lastName': lastName,
        'firstName': firstName,
        'userType': userType,
        'phone': phone,
        'email': email,
        "userRoleId": selectedUserRole,
        'partnerId': selectedPartner,
        'serviceProviderId': selectedServiceProvider
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // for registration saved in json then append data to json to register if accepted get key
      //Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      emailController.text = '';
      phoneController.text = '';
      lastnameController.text = '';
      firstnameController.text = '';
      yob.text = '';
      txtphone.text = '';
      passwordController.text = '';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Username or Password Not Ok!'),
          action: SnackBarAction(
            label: 'Enter Again',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }

  var jsonServiceProviders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // getServiceProviderCategories();
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xff476930),
            ),
          ),
          title: Text(
            'Register',
            style: TextStyle(fontSize: 15, color: Color(0xFF4B7447)),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SafeArea(
              child: Container(
                  // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(children: [
                    Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          //   child: TextFormField(
                          //     style: TextStyle(color: Color(0xFF4B7447)),
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'Please enter username';
                          //       }
                          //       return null;
                          //     },
                          //     controller: firstnameController,
                          //     decoration: InputDecoration(
                          //       border: OutlineInputBorder(),
                          //       labelText: 'First Name',
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Color(0xFF4B7447),
                                  height: 1.5),
                              controller: firstnameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                                hintText: 'First Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF4B7447),
                                    height: 1.5),
                                // controller: lastnameController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(14),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  hintText: 'Last Name',
                                ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Color(0xFF4B7447),
                                  height: 1.5),
                              // controller: lastnameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                                hintText: 'country/province',
                              ),
                            ),
                          ),
                          //partners dropdown
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              height: 52,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:BorderRadius.all(Radius.circular(4.0))),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                //underline:false,
                                // Initial Valu
                                style: TextStyle(color: Color(0xFF4B7447)),
                                value: selectedUserRole,
                                isExpanded: true,
                                isDense: true,
                                hint: new Text("Select User Type"),
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of userTypes
                                /*
                                items: userTypes.map((String userTypes) {
                                  return DropdownMenuItem(
                                    value: userTypes,
                                    child: Text(userTypes),
                                  );
                                }).toList(),
                                */
                                items: userRoleList
                                    .map((UserRoleModel userRoleModel) {
                                  return DropdownMenuItem(
                                    value: userRoleModel.id.toString(),
                                    child: new Text(userRoleModel.name),
                                  );
                                }).toList(),

                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedUserRole = newValue!;
                                    switchVal1 = 0;
                                    if (newValue == "2") {
                                      //Partner
                                      switchVal = 1;
                                    } else if (newValue == "3") {
                                      //Services Provider
                                      switchVal = 2;
                                    } else {
                                      //e.g Farmer
                                      switchVal = 0;
                                    }
                                  });
                                },
                              )
                              ),
                            ),
                          ),
                          //getCategory(1),
                          Column(
                            children: [
                              if (switchVal == 1) ...[
                                getServiceProviderCategories(),
                                //getServiceProviders()
                              ] else if (switchVal == 2) ...[
                                getPartnerCategories(),
                                // getPartners(),
                              ]
                            ],
                          ),
                          if (switchVal1 == 3) ...[
                            // getServiceProviderCategories(),
                            //getPartners(),
                            getServiceProviders(),
                          ] else if (switchVal1 == 4) ...[
                            getPartners(),
                          ],
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 51,
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              decoration: BoxDecoration(
                                // color: Colors.grey,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              ),
                              //https://github.com/natintosh/intl_phone_number_input/blob/develop/example/lib/main_dialog.dart
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                  phone = number.phoneNumber;
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                ignoreBlank: true,
                                autoValidateMode: AutovalidateMode.disabled,
                                initialValue: PhoneNumber(isoCode: 'KE'),
                                textFieldController: txtphone,
                                // inputBorder: OutlineInputBorder(),
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black87,height: 1.5),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter e-mail address",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.blue, width: 2)
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.redAccent)
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.blue, width: 2)
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent),
                                  contentPadding: EdgeInsets.all(14),
                                ),
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Email';
                                  } else if (!value.contains('@')) {
                                    return 'Please Enter Valid Email';
                                  }
                                  return null;
                                },
                                onSaved: (value){emailController.text = value!;}
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black87, height: 1.5),
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter Password",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.grey, width: 2)
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.red, width: 1)
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.red, width: 2)
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent),
                                  contentPadding: EdgeInsets.all(14),
                                ),
                                controller: passwordController,
                                validator: (value) {
                                  RegExp regxp = new RegExp(r'^.{6,}$');
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  if(!regxp.hasMatch(value)) {
                                    return "password should be at least 6 characters";
                                  }
                                  return null;
                                },
                                onSaved: (value){passwordController.text = value!;}
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black87,height: 1.5),
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Confirm password",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.grey, width: 2)
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.red, width: 1)
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: Colors.red, width: 2)
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent),
                                  contentPadding: EdgeInsets.all(14),
                                ),
                                // controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm Password';
                                  }
                                  return null;
                                },
                                // onSaved: (value){confirmPasswordController.text = value!;}
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,0,15,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  const [
                                Expanded(
                                    child: Divider(
                                        thickness: 2, height: 10,endIndent: 20, color: Color(0xFF4B7447))
                                ),
                                Text('OR',style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFF4B7447)),),
                                Expanded(
                                    child: Divider(
                                        thickness: 2, height: 20, indent: 20,color: Color(0xFF4B7447))
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  //open link
                                },
                                child: SizedBox(
                                  height: 37,
                                  width: 149,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset('assets/images/fcbk.jpeg'),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  // print('Go to google');
                                },
                                child: SizedBox(
                                  height: 37,
                                  width: 149,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset('assets/images/google.jpeg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <InlineSpan>[
                                        TextSpan(
                                            text: 'Already have an account? ',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 11)),
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AdjustedLogin()));
                                              },
                                            text: 'Sign-in',
                                            style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 11)),
                                      ]),
                                    )
                                  ]
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          registerUser(
                                              firstnameController.text,
                                              "",
                                              lastnameController.text,
                                              "Prefer not to say",
                                              emailController.text,
                                              phone.toString(),
                                              dropdownvalue,
                                              "Not Applicable",
                                              "Not Applicable",
                                              selectedUserRole,
                                              selectedPartner,
                                              selectedServiceProvider);
                                        }
                              },

                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: const Color(0XFFEB8A44), width: 2.0),
                                  color: const Color(0XFFEB8A44)),
                                child: Center(
                                  child: Text("Sign up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins')),
                                ),
                              ),
                            ),
                          ),

                          Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <InlineSpan>[
                                        TextSpan(
                                            text:
                                                'By clicking Sign Up, you agree to our ',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 11)),
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TermsPage()));
                                              },
                                            text: 'Terms of service',
                                            style: TextStyle(
                                                color: Color(0xFF7c9f48),
                                                fontSize: 11)),
                                        TextSpan(
                                            text: '  and  ',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 11)),
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return DialogPolicy(
                                                          mdFilename:
                                                              'PrivacyPolicy.md');
                                                    });
                                              },
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                                color: Color(0xFF7c9f48),
                                                fontSize: 11)),
                                      ]),
                                    )
                                  ])),
                        ])),
                  ])))
        ])));
  }

  Widget getServiceProviderCategories() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3A3B3A)),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        //underline:false,
        // Initial Valu
        isExpanded: true,
        isDense: true,
        hint: new Text("Select service provider category"),
        // value: selectedServiceProviderCategory,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        onChanged: (String? newValue) {
          setState(() {
            selectedServiceProviderCategory = newValue!;
            final index1 = serviceProviderCategoryList
                .indexWhere((element) => element.id == newValue);
            if (index1 != -1) {
              //print("Index $index1");
            }
            switchVal1 = 3;
            serviceProviderOptions =
                serviceProviderCategoryList[index1].serviceProviders;
            _loadData(SERVICE_PROVIDERS);
          });
        },
        items:
            serviceProviderCategoryList.map((ServiceProviderCategoryModel map) {
          // print(map);

          return DropdownMenuItem<String>(
            value: map.id,
            child: new Text(map.name),
          );
        }).toList(),
        value: selectedServiceProviderCategory,
        // After selecting the desired option,it will
        // change button value to selected value
      )),
    );
  }

  Widget getServiceProviders() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3A3B3A)),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        //underline:false,
        // Initial Valu
        isExpanded: true,
        isDense: true,
        hint: new Text("Select service provider "),
        // value: selectedServiceProviderCategory,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        onChanged: (String? newValue) {
          setState(() {
            selectedServiceProvider = newValue!;
          });
        },
        items: serviceProviderModelList
            .map((ServiceProviderModel serviceProviderModel) {
          // print(map);

          return DropdownMenuItem<String>(
            value: serviceProviderModel.id,
            child: new Text(serviceProviderModel.name),
          );
        }).toList(),
        value: selectedServiceProvider,
        // After selecting the desired option,it will
        // change button value to selected value
      )),
    );
  }

  Widget getPartnerCategories() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3A3B3A)),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              //underline:false,
              // Initial Valu
              //
              value: selectedPartnerCategory,
              isExpanded: true,
              isDense: true,
              hint: new Text("Select Partner Categories"),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: partnerCategoryList
                  .map((PartnerCategoryModel partnerCategoryModel) {
                return DropdownMenuItem(
                  value: partnerCategoryModel.id,
                  child: new Text(partnerCategoryModel.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPartnerCategory = newValue!;
                  final index1 = partnerCategoryList
                      .indexWhere((element) => element.id == newValue);
                  if (index1 != -1) {
                    //print("Index $index1");
                  }
                  switchVal1 = 4;
                  partnerOptions = partnerCategoryList[index1].partners;
                  _loadData(PARTNERS);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getPartners() {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3A3B3A)),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
                child: DropdownButton(
              //underline:false,
              // Initial Valu
              //
              value: selectedPartner,
              isDense: true,
              hint: new Text("Select Partner Categories"),

              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: partnerModelList.map((PartnerModel partnerModel) {
                return DropdownMenuItem(
                  value: partnerModel.id,
                  child: Text(partnerModel.name),
                );
              }).toList(),

              onChanged: (String? newValue) {
                setState(() {
                  selectedPartner = newValue!;
                  final index1 = partnerModelList
                      .indexWhere((element) => element.id == newValue);
                  if (index1 != -1) {
                    // print("Index $index1");
                  }
                  switchValPartnerCategories = 4;
                  partnerOptions = partnerCategoryList[index1].partners;
                  //_loadData4(partnerOptions);
                });
              },
            )),
          ],
        ));
  }

  _loadData(String endPoint) async {
    setState(() {
      if (endPoint == SERVICE_PROVIDER_CATEGORIES) {
        jsonServiceProviders = JsonDecoder().convert(serviceProviderCategories);
        serviceProviderCategoryList = (jsonServiceProviders)
            .map<ServiceProviderCategoryModel>(
                (item) => ServiceProviderCategoryModel.fromJson(item))
            .toList();
        selectedServiceProviderCategory = serviceProviderCategoryList[0].id;
      } else if (endPoint == PARTNER_CATEGORIES) {
        final jsonPartnerCategories = JsonDecoder().convert(partnerCategories);
        partnerCategoryList = (jsonPartnerCategories)
            .map<PartnerCategoryModel>(
                (item) => PartnerCategoryModel.fromJson(item))
            .toList();
        selectedPartnerCategory = partnerCategoryList[0].id;
      } else if (endPoint == SERVICE_PROVIDERS) {
        serviceProviderModelList = (serviceProviderOptions)
            .map<ServiceProviderModel>(
                (item) => ServiceProviderModel.fromJson(item))
            .toList();
        selectedServiceProvider = serviceProviderModelList[0].id;
      } else if (endPoint == PARTNERS) {
        partnerModelList = (partnerOptions)
            .map<PartnerModel>((item) => PartnerModel.fromJson(item))
            .toList();
        selectedPartner = partnerModelList[0].id;
      } else if (endPoint == USER_ROLES) {
        final jsonUserRoles = JsonDecoder().convert(userRoles);
        userRoleList = (jsonUserRoles)
            .map<UserRoleModel>((item) => UserRoleModel.fromJson(item))
            .toList();
        selectedUserRole = userRoleList[0].id.toString();
      }
    });
  }
}
