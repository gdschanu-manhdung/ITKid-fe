import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_finding.dart';
import 'package:frontend/views/compete/compete_ranking.dart';
import 'package:frontend/views/compete/component/status_bar_compete.dart';
import 'package:frontend/views/home/component/status_bar.dart';
import '../../base.dart';


class CompeteResult extends StatefulWidget {
  final int you_point;
  final int opp_point;
  CompeteResult({Key? key, required this.you_point, required this.opp_point})
      : super(key: key);

  @override
  _CompeteResultState createState() => _CompeteResultState();
}

class _CompeteResultState extends State<CompeteResult> {
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
                  builder: (context) =>  Menu(),
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
                                SizedBox(height: 20.v),
                                Text(
                                    "Final Result",
                                    style: theme.textTheme.headlineLarge!.copyWith(
                                      color: appTheme.black900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                    )
                                ),
                                SizedBox(height: 30.v),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                                    padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.v),
                                    decoration: AppDecoration.outlineBlueGray.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder20,
                                      color: const Color(0xFFFCFCFC),
                                    ),
                                    child: Padding(
                                      padding:EdgeInsets.only(top: 1.v),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10.v),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 1.h),
                                            child: buildInput(
                                                context,
                                                buildColor: appTheme.teal00,
                                                name: "You",
                                                point: widget.you_point.toString(),
                                            ),
                                          ),
                                          SizedBox(height: 15.v),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 1.h),
                                            child: buildInput(
                                                context,
                                                buildColor: appTheme.pink300,
                                                name: "Opponent",
                                                point: widget.opp_point.toString(),
                                            ),
                                          ),
                                          SizedBox(height: 15.v),
                                        ],
                                      ),
                                    )
                                ),
                                SizedBox(height: 30.v),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                                  child: buildButton(
                                    context,
                                    type: "Back To Home",
                                    buttonColor: const Color(0xff4394DD),
                                    boxDecoration: AppDecoration.fillTeal00.copyWith(
                                      borderRadius: BorderRadiusStyle.circleBorder35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.v),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                                  child: buildButton(
                                    context,
                                    type: "Find A Match",
                                    buttonColor: const Color.fromRGBO(255, 112, 142, 1),
                                    boxDecoration: AppDecoration.fillPink.copyWith(
                                      borderRadius: BorderRadiusStyle.circleBorder35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.v),
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
        )
    );
  }

  Widget buildInput(BuildContext context, {
    required Color buildColor,
    required String name,
    required String point,
  }) {
    return Container(
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 9.v),
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
          color: buildColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.h,
              ),
              child: Text(
                name,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.whiteA700,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(top: 3.v),
                child: Text(
                  point,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
            ),
          ],
        )
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
        } else if (type == "Back To Home") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(),
            ),
          );
        }
      },
      child: Container(
        width: SizeUtils.width / 2.5,
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