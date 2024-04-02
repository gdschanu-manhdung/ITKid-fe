import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

class OptionInput extends StatelessWidget {
  String option;
  OptionInput({Key? key,
    required this.option,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
        decoration: BoxDecoration(
          color: appTheme.gray100,
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