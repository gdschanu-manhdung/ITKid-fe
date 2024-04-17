import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

class OptionInput extends StatelessWidget {
  String option;
  bool isCorrect;
  bool isSelected;
  VoidCallback onPressed;

  OptionInput({
    Key? key,
    required this.option,
    required this.isCorrect,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  void updateSelected(bool value) {
    isSelected = value;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed) || isSelected) {
            return isCorrect ? Color(0xFF9BEDA3) : Color(0xFFFF3838);
          }
          return appTheme.gray100;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.v),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
        ),
        alignment: Alignment.center,
        child: Text(
          option,
          style: TextStyle(
            color: appTheme.black900,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
