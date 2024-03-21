import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_login.dart';
import 'package:frontend/views/auth/auth_recovery.dart';

class AuthForgotPassword extends StatelessWidget {
  AuthForgotPassword({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateEmail(String email) {
    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Biểu thức chính quy cho email
    RegExp regex = new RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Xử lý khi mọi thông tin đã hợp lệ, chẳng hạn chuyển hướng đến trang AuthRecovery
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthRecovery(),
        ),
      );
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
                  builder: (context) => AuthLogin(),
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
                    SizedBox(height: 44.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19.h),
                      child: CustomTextFormField(
                        controller: userNameController,
                        hintText: "Email or username",
                        hintStyle: CustomTextStyles.titleMediumBlue400,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
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
                    SizedBox(height: 15.v),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Center(
                        child: Text(
                          "A recovery code will be sent to your email",
                          style: CustomTextStyles.titleMediumBlue400SemiBold,
                        ),
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
                            "Send code",
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
