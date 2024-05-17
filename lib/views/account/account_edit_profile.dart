import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import '../../base.dart';
import '../home/component/status_bar.dart';
import 'account_view.dart';

class AccountEditProfile extends StatefulWidget {
  AccountEditProfile({Key? key}) : super(key: key);

  @override
  _AccountEditProfileState createState() => _AccountEditProfileState();
}

class _AccountEditProfileState extends State<AccountEditProfile> {
  TextEditingController emailController = TextEditingController();
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
              builder: (context) => Menu(index: 2,),
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
                  'Edit Profile Successful!',
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
      String newEmail = emailController.text;
      String newDob = lgInputController.text;
      String newPhoneNumber = phoneNumberController.text;
      // Tạo map chứa các giá trị mới
      Map<String, dynamic> newValues = {
        'newEmail': newEmail,
        'newDob': newDob,
        'newPhoneNumber': newPhoneNumber,
      };
      // Truyền giá trị mới sang trang Account
      Navigator.pop(context, newValues);
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
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: appTheme.blue50,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, size: 25),
                color: appTheme.black900,
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
                preferredSize: Size.fromHeight(4.0), // Đặt chiều cao của vùng chứa bóng
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Màu nền của container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Màu của bóng
                        spreadRadius: 4, // Bán kính phân tán của bóng
                        blurRadius: 5, // Độ mờ của bóng
                        offset: Offset(0, 2), // Độ lệch của bóng
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
                                      "Profile",
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
                                        leftText: "Name",
                                        rightText: "Hua Khanh Doan",
                                      )
                                  ),
                                  SizedBox(height: 20.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child: AccountInputEdit(
                                        context,
                                        leftText: "Email",
                                        rightWidget: CustomTextFormField(
                                          controller: emailController,
                                          textStyle: theme.textTheme.titleMedium!.copyWith(
                                              color: appTheme.black900,
                                              fontWeight: FontWeight.bold
                                          ),
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.h), // Đặt border radius
                                            borderSide: BorderSide(
                                              color: appTheme.blueGray50, // Đặt màu sắc của viền
                                              width: 1,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter new email";
                                            } else if (!validateEmail(value)) {
                                              return "Please enter a valid email address";
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                  ),
                                  SizedBox(height: 20.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child: AccountInputEdit(
                                        context,
                                        leftText: "Dob",
                                        rightWidget: CustomTextFormField(
                                          controller: lgInputController,
                                          textStyle: theme.textTheme.titleMedium!.copyWith(
                                              color: appTheme.black900,
                                              fontWeight: FontWeight.bold
                                          ),
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.h), // Đặt border radius
                                            borderSide: BorderSide(
                                              color: appTheme.blueGray50, // Đặt màu sắc của viền
                                              width: 1,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter new date of birth";
                                            } else if (!validateDateOfBirth(value)) {
                                              return "Please enter a valid date of birth";
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                  ),
                                  SizedBox(height: 20.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child: AccountInputEdit(
                                        context,
                                        leftText: "Phone",
                                        rightWidget: CustomTextFormField(
                                          controller: phoneNumberController,
                                          textStyle: theme.textTheme.titleMedium!.copyWith(
                                              color: appTheme.black900,
                                              fontWeight: FontWeight.bold
                                          ),
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.h), // Đặt border radius
                                            borderSide: BorderSide(
                                              color: appTheme.blueGray50, // Đặt màu sắc của viền
                                              width: 1,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter new phone number";
                                            } else if (!validatePhoneNumber(value)) {
                                              return "Please enter a valid phone number";
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                  ),
                                  SizedBox(height: 20.v),
                                  AccountInputMore(context),
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
  Widget AccountInput(BuildContext context, {required String leftText, required String rightText}) {
    return Container(
        constraints: BoxConstraints(maxHeight: 150.0),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
        decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 13.h, bottom: 1.v),
                child: Text(
                  leftText,
                  style: theme.textTheme.titleMedium!.copyWith(
                      color: appTheme.black900,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                rightText,
                style: theme.textTheme.titleMedium!.copyWith(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        )
    );
  }

  /// AccountInputEdit
  Widget AccountInputEdit(BuildContext context, {required String leftText, required Widget rightWidget}) {
    return Container(
      constraints: BoxConstraints(maxHeight: 150.0),
      padding: EdgeInsets.only(left: 10.h),
      decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 13.h),
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

  /// AccountLineMore
  Widget AccountInputMore(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23.h, bottom: 1.v),
            child: Text(
              "Wallet",
              style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Text(
              "250 ITK",
              style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: appTheme.black900,
            size: 20.h,
          )
        ],
      ),
    );
  }

  /// Button
  Widget AccountButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            ]
        )
    );
  }
}