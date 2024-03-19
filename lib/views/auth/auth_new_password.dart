import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_login.dart';

import '../../widgets/custom_text_form_field.dart';

class AuthNewPassword extends StatefulWidget {
  AuthNewPassword({Key? key}) : super(key: key);

  @override
  _AuthNewPasswordState createState() => _AuthNewPasswordState();
}

class _AuthNewPasswordState extends State<AuthNewPassword> {
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Xử lý khi mọi thông tin đã hợp lệ, chẳng hạn chuyển hướng đến trang AuthLogin
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthLogin(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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