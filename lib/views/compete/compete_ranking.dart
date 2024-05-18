import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart'; // Import SliverStickyHeader from flutter_sticky_header
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/home/component/status_bar.dart';
import '../../base.dart';
import '../../core/theme/theme_helper.dart';
import '../../core/utils/size_utils.dart';
import '../home/homePage.dart';

class CompeteRanking extends StatelessWidget {
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
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: Container(
              height: MediaQuery.of(context).size.height * 0.3, // Replace with your desired height
              decoration: BoxDecoration(
                color: const Color.fromRGBO(207, 254, 255, 1.0),
              ),
              child: Image.asset(
                'assets/images/ranking_bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.v),
                    padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
                    decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20,
                      color: const Color(0xFFFCFCFC),
                    ),
                    child: Column(
                      children: [
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFFB039),
                          imagePath: 'assets/images/challenger.png',
                          name: "Tran Manh Dung",
                          point: "100",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFC0C0C0),
                          imagePath: 'assets/images/grandmaster.png',
                          name: "Hua Khanh Doan",
                          point: "80",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFCD7F32),
                          imagePath: 'assets/images/master.png',
                          name: "Lan Nhi",
                          point: "60",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 1",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 2",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 3",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 4",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 5",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 6",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 7",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                        buildInput(
                          context,
                          buildColor: const Color(0xFFFCFCFC),
                          imagePath: 'assets/images/diamond.png',
                          name: "Cao Dung 8",
                          point: "50",
                        ),
                        SizedBox(height: 9.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInput(BuildContext context, {
    required Color buildColor,
    required String imagePath,
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
          Container(
            child: Image.asset(
              imagePath,
              height: SizeUtils.height * 0.05,
              width: SizeUtils.width * 0.1,
            ),
          ),
          SizedBox(width: 15.h,),
          Container(
            margin: EdgeInsets.only(bottom: 5.v),
            child: Text(
              name,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.black900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 5.v),
            child: Text(
              point,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.black900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
