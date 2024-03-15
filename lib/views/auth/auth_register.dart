import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

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
      // Đã nhập đầy đủ thông tin, xử lý đăng ký ở đây
      // Ví dụ: call API để xác thực thông tin đăng ký
      // Nếu không hợp lệ, đặt _registerFailed thành true và hiển thị modal thông báo
      setState(() {
        _registerFailed = true; // Đặt biến trạng thái _registerFailed thành true
      });
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
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRegisterSmlogo,
                    height: 260.v,
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
                  CustomTextFormField(
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
                  SizedBox(height: 13.v),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 13.v),
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
                  SizedBox(height: 13.v),
                  CustomTextFormField(
                    controller: lgInputController,
                    hintText: "MM/DD/YYYY",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter date of birth";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 13.v),
                  CustomTextFormField(
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
                          fontSize: 14.0,
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
