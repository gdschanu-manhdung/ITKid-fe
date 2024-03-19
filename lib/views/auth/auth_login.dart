import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import '../home/homePage.dart';
import 'auth_forgot_password.dart';
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
  bool _loginFailed = false;

  // void _navigateToForgotPassword(BuildContext context) {
  //   Navigator.pushNamed(context, '/auth_forgot_password');
  // }

  // void _navigateToRegister(BuildContext context) {
  //   Navigator.pushNamed(context, '/auth_register');
  // }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     // Handle form submission
  //   }
  // }

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Xác thực form thành công, chuyển hướng đến trang home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
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
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSmLogo,
                    height: 261.v,
                    width: 360.h,
                  ),
                  SizedBox(height: 40.v),
                  // Hiển thị modal thông báo nếu thông tin đăng nhập không hợp lệ
                  if (_loginFailed) ...[
                    Padding(
                      padding: EdgeInsets.only(bottom: 25.v),
                      child: Text(
                        "Login failed!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h, right: 21.h),
                    child: CustomTextFormField(
                      controller: userNameController,
                      hintText: "Email or username",
                      hintStyle: CustomTextStyles.titleMediumBlue400,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email or username";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h, right: 21.h),
                    child: CustomTextFormField(
                      controller: passwordController,
                      hintStyle: CustomTextStyles.titleMediumBlue400,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
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
