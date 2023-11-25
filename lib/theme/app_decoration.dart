import 'package:flutter/material.dart';
import 'package:minip/core/utils/size_utils.dart';
import 'package:minip/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange100,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo200,
      );
  static BoxDecoration get fillLightGreen => BoxDecoration(
        color: appTheme.lightGreen50,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow5001,
      );
  static BoxDecoration get fillYellow50 => BoxDecoration(
        color: appTheme.yellow50,
      );
  static BoxDecoration get fillYellow5002 => BoxDecoration(
        color: appTheme.yellow5002,
      );

  // Gradient decorations
  static BoxDecoration get gradientRedFToYellow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.02, -1.07),
          end: Alignment(1.04, 1.06),
          colors: [
            appTheme.red507f,
            appTheme.yellow5002,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );
  static BorderRadius get circleBorder80 => BorderRadius.circular(
        80.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL16 => BorderRadius.vertical(
        bottom: Radius.circular(16.h),
      );
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
        top: Radius.circular(32.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get roundedBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
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
