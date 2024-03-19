import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_new_password.dart';

import '../../widgets/custom_text_form_field.dart';

class AuthRecovery extends StatelessWidget {
  AuthRecovery({Key? key}) : super(key: key);

  TextEditingController recoveryCodeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Xử lý khi mọi thông tin đã hợp lệ, chẳng hạn chuyển hướng đến trang AuthNewPassword
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthNewPassword(),
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
                          "Enter Recovery Code",
                          style: CustomTextStyles.titleMediumBlue400SemiBold,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19.h),
                      child: CustomTextFormField(
                        controller: recoveryCodeController,
                        hintText: "1234567890",
                        hintStyle: CustomTextStyles.titleMediumBlue400,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your recovery code";
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
