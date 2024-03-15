import 'package:flutter/material.dart';
import 'package:frontend/core/utils/size_utils.dart';
import 'package:frontend/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleMediumBlue400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue400,
      );
  static get titleMediumBlue400SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue400,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBluegray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray50,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumff61b8b2 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF61B8B2),
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get saira {
    return copyWith(
      fontFamily: 'Saira',
    );
  }
}
