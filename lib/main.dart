// import 'package:flutter/material.dart';
// import 'package:frontend/base.dart';
// import 'package:frontend/views/auth/auth_main.dart';
// import 'core/utils/size_utils.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         // Use SizeUtils.width here instead of constraints.maxWidth
//         // Use SizeUtils.height here instead of constraints.maxHeight
//         return MaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
//             useMaterial3: true,
//           ),
//           home: Menu(),
//           debugShowCheckedModeBanner: false,
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/views/auth/auth_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasUserData = prefs.getBool('hasUserData') ?? false;

  runApp(MyApp(hasUserData: hasUserData));
}

class MyApp extends StatelessWidget {
  final bool hasUserData;

  const MyApp({Key? key, required this.hasUserData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(10.0),
          ),
        ),
      ),
      home: hasUserData ? Menu() : AuthLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

