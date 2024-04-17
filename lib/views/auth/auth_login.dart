import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import '../home/homePage.dart';
import 'auth_forgot_password.dart';
import 'auth_main.dart';
import 'auth_register.dart';

class AuthLogin extends StatefulWidget {
  AuthLogin({Key? key}) : super(key: key);

  @override
  _AuthLoginState createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _navigateToForgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthForgotPassword()),
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthRegister()),
    );
  }

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
              builder: (context) => MyHomePage(),
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
                  'Login Successful!',
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
      // Handle when all information is valid, for example navigate to Home screen
      _showSuccessDialog(context);
    }
  }

  bool validateEmail(String email) {
    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Biểu thức chính quy cho email
    RegExp regex = new RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(207, 252, 255, 1),
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
        ),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSmLogo,
                    height: 240.v,
                    width: 360.h,
                  ),
                  SizedBox(height: 40.v),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h, right: 21.h),
                    child: CustomTextFormField(
                      controller: userNameController,
                      hintText: "Email or username",
                      hintStyle: CustomTextStyles.titleMediumBlue400,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email or username";
                        } else if (!validateEmail(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 25.v),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h, right: 21.h),
                    child: CustomTextFormField(
                      controller: passwordController,
                      hintStyle: CustomTextStyles.titleMediumBlue400,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      showPasswordToggle: true,
                      iconColor: appTheme.blue400,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 18.v),
                  _buildBlueBtn(context),
                  SizedBox(height: 10.v),
                  GestureDetector(
                    onTap: () {
                      _navigateToForgotPassword(context);
                    },
                    child: Text(
                      "Forgot password?",
                      style: CustomTextStyles.titleMediumBlue400SemiBold,
                    ),
                  ),
                  SizedBox(height: 12.v),
                  GestureDetector(
                    onTap: () {
                      _navigateToRegister(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account yet?",
                            style: CustomTextStyles.titleMediumff61b8b2,
                          ),
                          TextSpan(
                            text: " Register",
                            style: CustomTextStyles.titleMediumff61b8b2.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: appTheme.teal300,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlueBtn(BuildContext context) {
    return GestureDetector(
      onTap: _submitForm,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 100.h, vertical: 10.v),
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
          color: Colors.blue, // Màu nền của nút
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 11.v),
          child: Text(
            "Login",
            style: CustomTextStyles.titleMediumWhiteA700,
          ),
        ),
      ),
    );
  }
}
