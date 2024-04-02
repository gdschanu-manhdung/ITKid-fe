import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_finding.dart';
import 'package:frontend/views/compete/compete_ranking.dart';
import 'package:frontend/views/compete/component/status_bar_compete.dart';
import '../../core/theme/theme_helper.dart';
import '../../core/utils/size_utils.dart';
import '../home/homePage.dart';

class Compete extends StatefulWidget {
  Compete({Key? key}) : super(key: key);

  @override
  CompeteState createState() => CompeteState();
}

class CompeteState extends State<Compete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 153, 175, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 35,),
          color: Color.fromRGBO(246, 0, 52, 1),
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
          NavigationBar2(),
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
                                    color: Color.fromRGBO(246, 0, 52, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  )
                              ),
                              SizedBox(height: 25.v),
                              ResultBox(),
                              SizedBox(height: 25.v),
                              InstructionBox(),
                              SizedBox(height: 26.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.h),
                                child: buildButton(
                                  context,
                                  type: "Find A Match",
                                  buttonColor: Color.fromRGBO(255, 112, 142, 1),
                                  boxDecoration: AppDecoration.fillPink.copyWith(
                                    borderRadius: BorderRadiusStyle.circleBorder35,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.h),
                                child: buildButton(
                                  context,
                                  type: "Rankings",
                                  buttonColor: Color.fromRGBO(255, 176, 57, 1),
                                  boxDecoration: AppDecoration.fillOrange.copyWith(
                                    borderRadius: BorderRadiusStyle.circleBorder35,
                                  ),
                                ),
                              ),
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
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
          color: Color.fromRGBO(255, 153, 175, 1),
      ),
      child: Padding(
          padding:EdgeInsets.only(top: 1.v),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your points:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                        color: Color.fromRGBO(246, 0, 52, 1),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your rankings:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "4",
                      style: TextStyle(
                        color: Color.fromRGBO(246, 0, 52, 1),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ]
          )
      ),
    );
  }

  Widget InstructionBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
        color: Color.fromRGBO(232, 175, 187, 1),
      ),
      child: Padding(
          padding:EdgeInsets.only(top: 1.v),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      "Press 'Find A Match'",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      "Waiting for your opponent",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      "If you win, you earn 10 points",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      "More points, higher position on",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Text(
                  "the rankings board",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      "Every month, 3 users with highest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Text(
                  "rankings will receive a special gift",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
          )
      ),
    );
  }

  Widget buildButton(BuildContext context,{
    required String type,
    required Color buttonColor,
    required BoxDecoration boxDecoration,
  }) {
    return GestureDetector(
      onTap: () {
        if (type == "Find A Match") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CompeteFinding(),
            ),
          );
        } else if (type == "Rankings") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CompeteRanking(),
            ),
          );
        }
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
}