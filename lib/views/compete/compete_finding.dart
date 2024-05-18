import 'package:flutter/material.dart';
import 'package:frontend/base.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_inmatch.dart';
import 'package:frontend/views/home/component/status_bar.dart';
import '../../core/theme/theme_helper.dart';
import '../../core/utils/size_utils.dart';

class CompeteFinding extends StatefulWidget {
  CompeteFinding({Key? key}) : super(key: key);

  @override
  _CompeteFindingState createState() => _CompeteFindingState();
}

class _CompeteFindingState extends State<CompeteFinding> {
  @override
  void initState() {
    super.initState();
    _showSuccessDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 25,),
            color: appTheme.black900,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Menu(index: 1,),
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
                child: Column(
                    children: [
                      SizedBox(
                          width: double.maxFinite,
                          child: Column(
                              children: [
                                SizedBox(height: 15.v),
                                Text(
                                    "Find A Match",
                                    style: theme.textTheme.headlineLarge!.copyWith(
                                      color: appTheme.pink300,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    )
                                ),
                                SizedBox(height: 110.v),
                                ResultBox(),
                                SizedBox(height: 150.v),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                                  child: buildButton(
                                    context,
                                    type: "Stop",
                                    buttonColor: const Color.fromRGBO(68, 212, 220, 1.0),
                                    boxDecoration: AppDecoration.fillPink.copyWith(
                                      borderRadius: BorderRadiusStyle.circleBorder35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.v),
                              ]
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  Widget ResultBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
        color: const Color(0xFFFCFCFC),
      ),
      child: Padding(
          padding:EdgeInsets.only(top: 1.v),
          child: Column(
            children: [
              const Text(
                "Waiting for your opponent",
                style: TextStyle(
                  color: Color(0XFFFF6F8E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.v),
              const Icon(
                Icons.search,
                size: 100,
                color: Color(0XFFFF6F8E),
              )
            ],
          ),
      ),
    );
  }

  Widget buildButton(BuildContext context,{
    required String type,
    required Color buttonColor,
    required BoxDecoration boxDecoration
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Menu(index: 1),
          ),
        );
      },
      child: Container(
        width: 200,
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder35,
          color: buttonColor,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.v),
          decoration: boxDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              Text(
                type,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.whiteA700,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              padding: EdgeInsets.all(25.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Opponent Found!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFFFF6F8E), // Change color if necessary
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'GOOOOOO!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFFFF6F8E), // Change color if necessary
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
      // Move to CompeteMatch after 1 second
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CompeteMatch(),
          ),
        );
      });
    });
  }
}