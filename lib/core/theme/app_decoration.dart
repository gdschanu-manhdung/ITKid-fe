import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue400,
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal300,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillPink => BoxDecoration(
    color: appTheme.pink300,
  );

  static BoxDecoration get fillOrange => BoxDecoration(
    color: appTheme.orange300,
  );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration();
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    color: appTheme.blueGray50,
    border: Border.all(
      color: appTheme.blueGray100,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, 4),
      ),
    ],
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder35 => BorderRadius.circular(
    35.h,
  );

  static BorderRadius get circleBorder25 => BorderRadius.circular(
    25.h,
  );

  static BorderRadius get circleBorder23 => BorderRadius.circular(
    23.h,
  );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20.h,
  );

  static BorderRadius get roundedBorder15 => BorderRadius.circular(
    15.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
