import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/account/account_change_password.dart';
import 'package:frontend/views/account/account_edit_profile.dart';
import 'package:frontend/views/home/homePage.dart';
import '../home/component/status_bar.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  TextEditingController emailController = TextEditingController();
  TextEditingController lgInputController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _navigateToEditProfile(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountEditProfile()),
    );
  }

  void _navigateToChangePassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountChangePassword()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: appTheme.blue50,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
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
                        leftText: "Name",
                        rightText: "Hua Khanh Doan",
                      )
                    ),
                    SizedBox(height: 20.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: AccountInput(
                          context,
                          leftText: "Email",
                          rightText: "huakhanhdoan@gmail.com",
                        )
                    ),
                    SizedBox(height: 20.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: AccountInput(
                          context,
                          leftText: "Dob",
                          rightText: "30/02/2024",
                        )
                    ),
                    SizedBox(height: 20.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: AccountInput(
                          context,
                          leftText: "Phone",
                          rightText: "0123456789",
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
      padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
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
              "30 ITK",
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _navigateToEditProfile(context);
            },
          child: Container  (
            margin: EdgeInsets.only(top: 2.v, right: 10.h, bottom: 2.v),
            decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 10.v),
              decoration: AppDecoration.fillBlue.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  Text(
                    "Edit Profile",
                    style: CustomTextStyles.titleMediumWhiteA700,
                  )
                ]
              ),
            ),
          ),),
          GestureDetector(
            onTap: () {
              _navigateToChangePassword(context);
            },
          child: Container(
            margin: EdgeInsets.only(top: 2.v, right: 10.h, bottom: 2.v),
            decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
              decoration: AppDecoration.fillPink.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 1.v),
                    Text(
                      "Change Password",
                      style: CustomTextStyles.titleMediumWhiteA700,
                    )
                  ]
              ),
            ),
          ),)
        ]
      )
    );
  }
}