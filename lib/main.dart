// import 'package:flutter/material.dart';
// import 'package:frontend/views/auth/auth_main.dart';
// import 'package:frontend/views/home/homePage.dart';
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
//       home: const AuthMain(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/views/auth/auth_main.dart';
import 'core/utils/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // Use SizeUtils.width here instead of constraints.maxWidth
        // Use SizeUtils.height here instead of constraints.maxHeight
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            useMaterial3: true,
          ),
          home: AuthMain(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}


