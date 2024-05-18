import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_finding.dart';
import 'package:frontend/views/compete/compete_ranking.dart';


class Compete extends StatefulWidget {
  Compete({Key? key}) : super(key: key);

  @override
  CompeteState createState() => CompeteState();
}

class CompeteState extends State<Compete> {
  @override
  Widget build(BuildContext context) {
    return
         ListView(
           children: [
             const SizedBox(height: 90,),
             SizedBox(
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
                                  Image.asset(
                                    'assets/images/find_a_match.jpg', // Đường dẫn tới ảnh trong thư mục assets
                                    width: MediaQuery.of(context).size.width * 1, // Chiều rộng của ảnh
                                    height: MediaQuery.of(context).size.width * 0.4, // Chiều cao của ảnh
                                    fit: BoxFit.cover, // Cách hiển thị ảnh trong khung
                                  ),
                                  InstructionBox(),
                                  SizedBox(height: 15.v),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                                    child: buildButton(
                                      context,
                                      type: "Find A Match",
                                      buttonColor: const Color.fromRGBO(80, 169, 173, 1.0),
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
                                      buttonColor: const Color.fromRGBO(255, 176, 57, 1),
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
                     ),
             // const SizedBox(height: 100,),
           ],
         );

  }

  Widget InstructionBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
        color: appTheme.teal00,
      ),
      child: Padding(
          padding:EdgeInsets.only(top: 1.v),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Press 'Find A Match' and Waiting for your opponent. If you win, you earn 10 points."
                      " More points, higher position on the rankings board. Every month, 3 users with "
                      "highest rankings will receive a special gift",
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
          padding: EdgeInsets.symmetric(vertical: 10.v),
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