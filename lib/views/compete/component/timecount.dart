import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

class TimeCount extends StatelessWidget {
  String time;
  TimeCount({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.h),
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15.v),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        // borderRadius: BorderRadiusStyle.roundedBorder15,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 4,
        //     blurRadius: 5,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Time:",
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.black900,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            time,
            style: theme.textTheme.headlineSmall!.copyWith(
              color: Color(0xFFF60034),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
