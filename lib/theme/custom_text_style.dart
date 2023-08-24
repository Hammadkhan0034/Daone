import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleSmallPoppinsBlack900 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          15,
        ),
      );
  static get titleSmallPoppinsGray90001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray90001,
      );
  static get titleSmallHindSiliguriGray70001 =>
      theme.textTheme.titleSmall!.hindSiliguri.copyWith(
        color: appTheme.gray70001,
      );
  static get titleSmallPoppinsGray90002 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray90002,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumHindSiliguriIndigo9000118 =>
      theme.textTheme.titleMedium!.hindSiliguri.copyWith(
        color: appTheme.indigo90001,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleSmallPoppinsGray90002_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray90002,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsBlack900SemiBold =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          15,
        ),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallDMSansDeeporangeA20005 =>
      theme.textTheme.titleSmall!.dMSans.copyWith(
        color: appTheme.deepOrangeA20005,
      );
  static get titleMediumWhiteA700Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray80005 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray80005,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeGray90002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallHindSiliguriIndigo90001 =>
      theme.textTheme.titleSmall!.hindSiliguri.copyWith(
        color: appTheme.indigo90001,
      );
  static get titleSmallBluegray90001_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get titleSmallDMSansWhiteA700 =>
      theme.textTheme.titleSmall!.dMSans.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleSmallPoppinsWhiteA700_1 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallHindSiliguriBluegray300 =>
      theme.textTheme.titleSmall!.hindSiliguri.copyWith(
        color: appTheme.blueGray300,
      );
  static get titleLargeDeeporangeA20006 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepOrangeA20006,
      );
  static get titleMediumHindSiliguriWhiteA70001 =>
      theme.textTheme.titleMedium!.hindSiliguri.copyWith(
        color: appTheme.whiteA70001,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumHindSiliguriIndigo90001 =>
      theme.textTheme.titleMedium!.hindSiliguri.copyWith(
        color: appTheme.indigo90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsGray80002 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray80002,
        fontSize: getFontSize(
          15,
        ),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPoppinsDeeporangeA20002 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.deepOrangeA20002,
        fontSize: getFontSize(
          15,
        ),
      );
  static get titleSmallPoppinsWhiteA700 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumWhiteA700Medium_2 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumWhiteA700Medium_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack90018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumGray90003 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleMediumGray90003Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPoppinsErrorContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleLarge21 => theme.textTheme.titleLarge!.copyWith(
        fontSize: getFontSize(
          21,
        ),
      );
  static get titleLargeBluegray700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray700,
      );
  static get titleSmallBluegray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsWhiteA70015 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          15,
        ),
      );
  // Label text style
  static get labelMediumGray500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: getFontSize(
          11,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumGray70003 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray70003,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallGray700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray700,
        fontSize: getFontSize(
          9,
        ),
      );
  static get labelMediumGray90003Medium_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90003,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBluegray400ddMedium =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray400Dd,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray90003 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90003.withOpacity(0.87),
        fontWeight: FontWeight.w500,
      );
  static get labelSmallGray60004 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray60004,
        fontSize: getFontSize(
          9,
        ),
      );
  static get labelLargeBluegray400dd => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray400Dd,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumRobotoBluegray40001 =>
      theme.textTheme.labelMedium!.roboto.copyWith(
        color: appTheme.blueGray40001,
        fontSize: getFontSize(
          11,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeWhiteA700Medium => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumErrorContainer11 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: getFontSize(
          11,
        ),
      );
  static get labelLargeHindSiliguriGray70001 =>
      theme.textTheme.labelLarge!.hindSiliguri.copyWith(
        color: appTheme.gray70001,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumGray90003 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90003.withOpacity(0.87),
        fontWeight: FontWeight.w500,
      );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelLargeGray50005 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50005,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallErrorContainer => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w700,
      );
  static get labelSmallWhiteA7009_1 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          9,
        ),
      );
  static get labelMediumBluegray400dd => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray400Dd,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeHindSiliguriIndigo200 =>
      theme.textTheme.labelLarge!.hindSiliguri.copyWith(
        color: appTheme.indigo200,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumGray60001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumErrorContainer => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          13,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBluegray70001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray70001,
        fontSize: getFontSize(
          11,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray80001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80001,
        fontSize: getFontSize(
          13,
        ),
        fontWeight: FontWeight.w600,
      );
  static get labelMediumGray90003Medium =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          11,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeBlack900SemiBold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeGray80001SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumSemiBold => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelSmallGray500 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray500,
      );
  static get labelLargeErrorContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get labelSmallWhiteA7009 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          9,
        ),
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  // Poppins text style
  static get poppinsOnError => TextStyle(
        color: theme.colorScheme.onError,
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w400,
      ).poppins;
  static get poppinsDeeporangeA20001 => TextStyle(
        color: appTheme.deepOrangeA20001,
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w500,
      ).poppins;
  static get poppinsWhiteA700Regular => TextStyle(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          6,
        ),
        fontWeight: FontWeight.w400,
      ).poppins;
  static get poppinsWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w500,
      ).poppins;
  static get poppinsBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w400,
      ).poppins;
  static get poppinsWhiteA700Regular6 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          6,
        ),
        fontWeight: FontWeight.w400,
      ).poppins;
  // Body text style
  static get bodyMediumGray90003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          13,
        ),
      );
  static get bodySmallGray500dd => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500Dd,
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodyMediumGray90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
        fontSize: getFontSize(
          15,
        ),
      );
  static get bodyMediumGray90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodySmallGray60005 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60005,
      );
  static get bodySmallGray60003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60003,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallGray60002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60002,
      );
  static get bodyLargeHindSiliguriIndigo90001 =>
      theme.textTheme.bodyLarge!.hindSiliguri.copyWith(
        color: appTheme.indigo90001,
        fontSize: getFontSize(
          16,
        ),
      );
  static get bodySmallGray900019 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90001,
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodySmallGray9000310 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallGray9000311 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          11,
        ),
      );
  static get bodySmallGreen500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.green500,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodyMediumHindSiliguriIndigoA10001 =>
      theme.textTheme.bodyMedium!.hindSiliguri.copyWith(
        color: appTheme.indigoA10001,
      );
  static get bodySmallWhiteA70010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodyLargeHindSiliguriIndigo900 =>
      theme.textTheme.bodyLarge!.hindSiliguri.copyWith(
        color: appTheme.indigo900,
        fontSize: getFontSize(
          16,
        ),
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          11,
        ),
      );
  static get bodySmallBluegray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray400.withOpacity(0.87),
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallOnError_1 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodySmallInterGray50005 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray50005,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallGray90002_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodySmallGreen5008 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.green500,
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodyMediumWhiteA700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumHindSiliguriCyan400 =>
      theme.textTheme.bodyMedium!.hindSiliguri.copyWith(
        color: appTheme.cyan400,
      );
  static get bodySmallGray50002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50002,
      );
  static get bodySmallGray9000311_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          11,
        ),
      );
  static get bodyMediumHindSiliguriRed200 =>
      theme.textTheme.bodyMedium!.hindSiliguri.copyWith(
        color: appTheme.red200,
      );
  static get bodySmallInterGray90002 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray90002,
      );
  static get bodySmallGray50005 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50005,
      );
  static get bodyMediumBlack900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodySmallDeeporangeA20006 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.deepOrangeA20006,
      );
  static get bodyMediumHindSiliguriPinkA100 =>
      theme.textTheme.bodyMedium!.hindSiliguri.copyWith(
        color: appTheme.pinkA100,
      );
  static get bodySmallBlack9009 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodySmallGray600058 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60005,
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallBlack9008 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodyMediumGray90002_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodySmall10_1 => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallBluegray40010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray400,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodyLargePoppinsGray9000318 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          18,
        ),
      );
  static get bodySmallGray6000510 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60005,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallGray6000511 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60005,
        fontSize: getFontSize(
          11,
        ),
      );
  static get bodySmallGray500058 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50005,
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallRed500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.red500,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodySmallWhiteA7009 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodySmallWhiteA7008 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodySmallGray90001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90001,
        fontSize: getFontSize(
          11,
        ),
      );
  static get bodySmallGray90002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodySmallGray90003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90003,
      );
  static get bodyMediumRadleyGray800 =>
      theme.textTheme.bodyMedium!.radley.copyWith(
        color: appTheme.gray800,
        fontSize: getFontSize(
          15,
        ),
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargePoppinsGray90003 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          16,
        ),
      );
  static get bodyLargePoppinsGray90002 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray90002,
        fontSize: getFontSize(
          16,
        ),
      );
  static get bodySmallBlack90011 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          11,
        ),
      );
  static get bodySmallBlack90010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallRadleyGray90003 =>
      theme.textTheme.bodySmall!.radley.copyWith(
        color: appTheme.gray90003,
        fontSize: getFontSize(
          11,
        ),
      );
  // Headline text style
  static get headlineSmallGray90002 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get radley {
    return copyWith(
      fontFamily: 'Radley',
    );
  }

  TextStyle get hindSiliguri {
    return copyWith(
      fontFamily: 'Hind Siliguri',
    );
  }
}
