import 'package:flutter/material.dart';
import 'package:frontend/views/auth/auth_recovery.dart';
import '../views/auth/auth_forgot_password.dart';
import '../views/auth/auth_login.dart';
import '../views/auth/auth_main.dart';
import '../views/auth/auth_new_password.dart';
import '../views/auth/auth_register.dart';

class AppRoutes {
  static const String authMain = '/auth_main';

  static const String authLogin = '/auth_login';

  static const String authRegister = '/auth_register';

  static const String authForgotPassword = '/auth_forgot_password';

  static const String authRecovery = '/auth_recovery';

  static const String authNewPassword = '/auth_new_password';

  static Map<String, WidgetBuilder> routes = {
    authMain: (context) => AuthMain(),
    authLogin: (context) => AuthLogin(),
    authRegister: (context) => AuthRegister(),
    authForgotPassword: (context) => AuthForgotPassword(),
    authRecovery: (context) => AuthRecovery(),
    authNewPassword: (context) => AuthNewPassword(),
  };
}
