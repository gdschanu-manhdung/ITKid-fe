import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_login.dart';
import 'package:frontend/views/auth/auth_register.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({Key? key}) : super(key: key);

  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthLogin()),
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthRegister()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: appTheme.whiteA700,
          body: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              image: DecorationImage(
                image: AssetImage(ImageConstant.imgNoAuthMain),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 50.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Container(
                    decoration: AppDecoration.outlineBlack,
                    child: _buildXlBlueBtn(
                      context,
                      login: "Login",
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: AppDecoration.outlineBlack,
                    child: _buildXlGreenBtn(
                      context,
                      register: "Register",
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  ///  Common Widget

  Widget _buildXlBlueBtn(BuildContext context, {required String login}) {
    return GestureDetector(
      onTap: () {
        _navigateToLogin(context);
      },
      child: Container(
        width: SizeUtils.width / 2.0,
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
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 53.v, vertical: 11.v),
          decoration: AppDecoration.fillBlue.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder25,
          ),
          child: Text(
            login,
            style: CustomTextStyles.titleMediumWhiteA700.copyWith(
              color: appTheme.whiteA700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  Widget _buildXlGreenBtn(BuildContext context, {required String register}) {
    return GestureDetector(
      onTap: () {
        _navigateToRegister(context);
      },
      child: Container(
        width: SizeUtils.width / 2.0,
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
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 53.v, vertical: 11.v),
          decoration: AppDecoration.fillTeal.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder25,
          ),
          child: Text(
            register,
            style: CustomTextStyles.titleMediumWhiteA700.copyWith(
              color: appTheme.whiteA700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
