import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

class InputScoreRight extends StatelessWidget {
  String point;
  String player;
  InputScoreRight({Key? key, required this.point, required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.v),
      decoration: BoxDecoration(
        color: appTheme.pink100,
        borderRadius: BorderRadiusStyle.roundedBorder15,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v, bottom: 1.v),
            child: Text(
              point,
              style: theme.textTheme.titleMedium!.copyWith(
                color: Color(0xFFF60034),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v, bottom: 1.v),
            child: Text(
              player,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: appTheme.whiteA700,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
