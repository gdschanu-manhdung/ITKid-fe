import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_prematch.dart';
import 'package:frontend/views/compete/component/status_bar_compete.dart';
import '../../base.dart';
import '../../core/theme/theme_helper.dart';
import '../../core/utils/size_utils.dart';
import '../home/homePage.dart';

class CompeteRanking extends StatefulWidget {
  CompeteRanking({Key? key}) : super(key: key);

  @override
  _CompeteRankingState createState() => _CompeteRankingState();
}

class _CompeteRankingState extends State<CompeteRanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 153, 175, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 35,),
            color: const Color.fromRGBO(246, 0, 52, 1),
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
            NavigationBar2(),
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
                                    "Rankings",
                                    style: theme.textTheme.headlineLarge!.copyWith(
                                      color: const Color.fromRGBO(246, 0, 52, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    )
                                ),
                                SizedBox(height: 15.v),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30.h),
                                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                                  decoration: AppDecoration.outlineBlueGray.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder20,
                                    color: const Color(0xFFFCFCFC),
                                  ),
                                  child: Padding(
                                    padding:EdgeInsets.only(top: 1.v),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Your rank: 20",
                                          style: TextStyle(
                                            color: Color(0xFFF60034),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFFFB039),
                                              index: "1",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFC0C0C0),
                                              index: "2",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFCD7F32),
                                              index: "3",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFFCFCFC),
                                              index: "4",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFFCFCFC),
                                              index: "5",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFFCFCFC),
                                              index: "6",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFFCFCFC),
                                              index: "7",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                                          child: buildInput(
                                              context,
                                              buildColor: const Color(0xFFFCFCFC),
                                              index: "8",
                                              name: "Nguyen Van A",
                                              point: "150"
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                      ],
                                    ),
                                  )
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
    required String index,
    required String name,
    required String point,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 9.v),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
        color: buildColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Text(
              index,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.black900,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              top: 3.v,
            ),
            child: Text(
              name,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.black900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text(
                point,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
        ],
      )
    );
  }
}