import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_main.dart';

class AuthRegister extends StatefulWidget {
  AuthRegister({Key? key}) : super(key: key);

  @override
  _AuthRegisterState createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  double _appBarHeight = 230.v;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _appBarHeight = 230.v - _scrollController.offset;
        if (_appBarHeight < kToolbarHeight) {
          _appBarHeight = kToolbarHeight;
        }
      });
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lgInputController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AuthMain(),
            ),
          );
        });
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registration Successful!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.blue400,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle when all information is valid, for example navigate to AuthLogin screen
      _showSuccessDialog(context);
    }
  }

  bool validateEmail(String email) {
    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Biểu thức chính quy cho email
    RegExp regex = new RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  bool validateDateOfBirth(String dob) {
    try {
      List<String> dateParts = dob.split('/');
      int day = int.parse(dateParts[1]);
      int month = int.parse(dateParts[0]);
      int year = int.parse(dateParts[2]);

      bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

      int maxDaysInMonth;
      if (month == 2) {
        maxDaysInMonth = isLeapYear ? 29 : 28;
      } else if ([4, 6, 9, 11].contains(month)) {
        maxDaysInMonth = 30;
      } else {
        maxDaysInMonth = 31;
      }

      if (year < 1900 || year > DateTime.now().year) {
        return false;
      } else if (month < 1 || month > 12) {
        return false;
      } else if (day < 1 || day > maxDaysInMonth) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  bool validatePhoneNumber(String phoneNumber) {
    // Null or empty string is invalid phone number
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(phoneNumber)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Color.fromRGBO(115, 219, 213, 1),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, size: 35),
                color: appTheme.blue400,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthMain(),
                    ),
                  );
                },
              ),
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: 230.v,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    background: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: _appBarHeight,
                      width: constraints.maxWidth,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgRegisterSmlogo,
                        height: 230.v,
                        width: 360.h,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: emailController,
                            hintText: "Email",
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter email";
                              } else if (!validateEmail(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: "Password",
                            obscureText: true,
                            showPasswordToggle: true,
                            iconColor: appTheme.teal300,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: fullNameController,
                            hintText: "Full Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter full name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: lgInputController,
                            hintText: "MM/DD/YYYY",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter date of birth";
                              } else if (!validateDateOfBirth(value)) {
                                return "Please enter a valid date of birth (MM/DD/YYYY)";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: phoneNumberController,
                            hintText: "Parent’s Phone Number",
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter phone number";
                              } else if (!validatePhoneNumber(value)) {
                                return "Please enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.v),
                          GestureDetector(
                            onTap: _submitForm,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 11.v),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
