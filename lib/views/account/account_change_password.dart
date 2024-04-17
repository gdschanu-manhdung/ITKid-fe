import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/account/account_view.dart';

import '../../base.dart';
import '../home/component/status_bar.dart';

class AccountChangePassword extends StatefulWidget {
  AccountChangePassword({Key? key}) : super(key: key);

  @override
  _AccountChangePasswordState createState() => _AccountChangePasswordState();
}

class _AccountChangePasswordState extends State<AccountChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(index: 2,),
            ),
          );
        });
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Change Password Successful!',
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
      _showSuccessDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: appTheme.blue50,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, size: 35),
                color: appTheme.blue400,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(index: 2,),
                    ),
                  );
                },
              ),
              actions: <Widget>[
                NavigationBar1(),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4.0), // Đặt chiều cao của vùng chứa bóng
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Màu nền của container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Màu của bóng
                        spreadRadius: 4, // Bán kính phân tán của bóng
                        blurRadius: 5, // Độ mờ của bóng
                        offset: const Offset(0, 2), // Độ lệch của bóng
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(
                                children: [
                                  SizedBox(height: 10.v),
                                  Text(
                                      "Account",
                                      style: theme.textTheme.headlineLarge!.copyWith(
                                        color: appTheme.blue400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      )
                                  ),
                                  SizedBox(height: 15.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child: AccountInput(
                                        context,
                                        leftText: "Old Password",
                                        rightWidget: CustomTextFormField(
                                          controller: passwordController,
                                          textStyle: theme.textTheme.titleMedium!.copyWith(
                                              color: appTheme.black900,
                                              fontWeight: FontWeight.bold
                                          ),
                                          obscureText: true,
                                          showPasswordToggle: true,
                                          iconColor: appTheme.black900,
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.h), // Đặt border radius
                                            borderSide: BorderSide(
                                              color: appTheme.blueGray50, // Đặt màu sắc của viền
                                              width: 1,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter old password";
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                  ),
                                  SizedBox(height: 20.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child: AccountInput(
                                        context,
                                        leftText: "New Password",
                                        rightWidget: CustomTextFormField(
                                          controller: newPasswordController,
                                          textStyle: theme.textTheme.titleMedium!.copyWith(
                                              color: appTheme.black900,
                                              fontWeight: FontWeight.bold
                                          ),
                                          obscureText: true,
                                          showPasswordToggle: true,
                                          iconColor: appTheme.black900,
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.h), // Đặt border radius
                                            borderSide: BorderSide(
                                              color: appTheme.blueGray50, // Đặt màu sắc của viền
                                              width: 1,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter new password";
                                            } else if (value == passwordController.text) {
                                              return "New password can't be the same";
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                  ),
                                  SizedBox(height: 25.v),
                                  AccountButton(context),
                                  SizedBox(height: 75.v),
                                ]
                            )
                        )
                    )
                )
            )
        )
    );
  }

  /// AccountLine
  Widget AccountInput(BuildContext context, {required String leftText, required Widget rightWidget}) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150.0),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 5.h, bottom: 1.v),
              child: Text(
                leftText,
                style: theme.textTheme.titleMedium!.copyWith(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            flex: 3,
            child: rightWidget,
          ),
        ],
      ),
    );
  }

  /// Button
  Widget AccountButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _submitForm,
                child: Container(
                  margin: EdgeInsets.only(top: 2.v, right: 10.h, bottom: 2.v),
                  decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 55.h, vertical: 10.v),
                    decoration: AppDecoration.fillTeal.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 1.v),
                          Text(
                            "Save",
                            style: CustomTextStyles.titleMediumWhiteA700,
                          )
                        ]
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(index: 2,),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.v, right: 10.h, bottom: 2.v),
                  decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20
                  ),
                  child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 54.h, vertical: 10.v),
                    decoration: AppDecoration.fillPink.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 1.v),
                          Text(
                            "Cancel",
                            style: CustomTextStyles.titleMediumWhiteA700,
                          )
                        ]
                    ),
                  ),
                ),
              ),
            ]
        )
    );
  }
}
