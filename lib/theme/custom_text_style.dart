import 'package:flutter/material.dart';
import 'package:minip/core/utils/size_utils.dart';
import 'package:minip/theme/theme_helper.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack90001 => theme.textTheme.bodyLarge.copyWith(
        color: appTheme.black90001.withOpacity(0.45),
        fontSize: 17.fSize,
      );
  static get bodyLargeBluegray900 => theme.textTheme.bodyLarge.copyWith(
        color: appTheme.blueGray900,
      );
  static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeGray50002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50002,
      );
  static get bodyLargeGray50003 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50003,
      );
  static get bodyLargeGray500_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray60002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray60002,
        fontSize: 17.fSize,
      );
  static get bodyLargeGray60003 => theme.textTheme.bodyLarge.copyWith(
        color: appTheme.gray60003,
        fontSize: 17.fSize,
      );
  static get bodyLargeGray700 => theme.textTheme.bodyLarge.copyWith(
        color: appTheme.gray700,
      );
  static get bodyLargeGray90001 => theme.textTheme.bodyLarge.copyWith(
        color: appTheme.gray90001,
        fontSize: 17.fSize,
      );
  static get bodyLargeOnErrorContainer => theme.textTheme.bodyLarge.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 17.fSize,
      );
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
      );
  static get bodyLargePrimary17 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 17.fSize,
      );
  static get bodySmallGray60001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodySmallRedA10001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.redA10001,
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineSmallBlack90001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90001.withOpacity(0.85),
      );
  static get headlineSmallNunitoGreen100 =>
      theme.textTheme.headlineSmall!.nunito.copyWith(
        color: appTheme.green100,
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get headlineSmallRedA10001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.redA10001,
        fontSize: 24.fSize,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeSignikaGreen400 =>
      theme.textTheme.labelLarge!.signika.copyWith(
        color: appTheme.green400,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeSignikaIndigo20001 =>
      theme.textTheme.labelLarge!.signika.copyWith(
        color: appTheme.indigo20001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeSignikaOnPrimaryContainer =>
      theme.textTheme.labelLarge!.signika.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleLargeGray70001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray70001,
      );
  static get titleMediumBlack90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 16.fSize,
      );
  static get titleMediumGray90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleMediumGreen40001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green40001,
        fontSize: 16.fSize,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 18.fSize,
      );
}

extension on TextStyle {
  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get signika {
    return copyWith(
      fontFamily: 'Signika',
    );
  }

  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }
}
