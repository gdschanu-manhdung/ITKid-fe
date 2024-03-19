import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_main.dart';

class AuthRegister extends StatefulWidget {
  AuthRegister({Key? key}) : super(key: key);

  @override
  _AuthRegisterState createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lgInputController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool _registerFailed = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Xử lý khi mọi thông tin đã hợp lệ, chẳng hạn chuyển hướng đến trang AuthLogin
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthMain(),
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
          width: double.infinity,
          child: SingleChildScrollView(
            // padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRegisterSmlogo,
                    height: 240.v,
                    width: 360.h,
                  ),
                  SizedBox(height: 13.v),
                  if (_registerFailed)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Register failed!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextFormField(
                      controller: emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextFormField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true, // Make it initially obscure
                      showPasswordToggle: true, // Enable password toggle
                      iconColor: appTheme.teal300,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextFormField(
                      controller: fullNameController,
                      hintText: "Full Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter full name";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextFormField(
                      controller: lgInputController,
                      hintText: "MM/DD/YYYY",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter date of birth";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextFormField(
                      controller: phoneNumberController,
                      hintText: "Parent’s Phone Number",
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter phone number";
                        }
                        return null;
                      },
                    ),
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
                        color: Colors.blue, // Màu nền của nút
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
        ),
      ),
    );
  }
}
