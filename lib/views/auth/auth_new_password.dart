import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_login.dart';
import 'package:frontend/views/auth/auth_recovery.dart';

class AuthNewPassword extends StatefulWidget {
  AuthNewPassword({Key? key}) : super(key: key);

  @override
  _AuthNewPasswordState createState() => _AuthNewPasswordState();
}

class _AuthNewPasswordState extends State<AuthNewPassword> {
  TextEditingController passwordController = TextEditingController();

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
              builder: (context) => AuthLogin(),
            ),
          );
        });
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 150,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Change Password Successfully!',
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

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Xử lý khi mọi thông tin đã hợp lệ, chuyển hướng đến trang AuthLogin
      _showSuccessDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(207, 252, 255, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthRecovery(),
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
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSmLogo,
                      height: 261.v,
                      width: 360.h,
                    ),
                    SizedBox(height: 25.v),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "Enter your new password",
                          style: CustomTextStyles.titleMediumBlue400SemiBold,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19.h),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        hintStyle: CustomTextStyles.titleMediumBlue400,
                        obscureText: true,
                        showPasswordToggle: true, // Enable password toggle
                        iconColor: appTheme.blue400,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your new password";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 18.v),
                    GestureDetector(
                      onTap: () {
                        _submitForm(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 100.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.blue,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(11.h),
                          decoration: AppDecoration.fillBlue.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder25,
                          ),
                          child: Text(
                            "Change password",
                            style: CustomTextStyles.titleMediumWhiteA700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
