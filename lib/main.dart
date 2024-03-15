// import 'package:flutter/material.dart';
// import 'package:frontend/views/auth/auth_main.dart';
// import 'package:frontend/views/homePage.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
//         useMaterial3: true,
//       ),
//       // home: const MyHomePage(title: 'ITKIT'),
//       home: const AuthMain(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'frontend',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.authForgotPassword,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}


