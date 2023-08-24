import 'dart:ui';
import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillDeeporangeA20001 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrangeA20001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
      );
  static ButtonStyle get fillDeeporangeA20005 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrangeA20005,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      );
  static ButtonStyle get fillDeeporangeA20005TL18 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrangeA20005,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
      );
  static ButtonStyle get fillDeeporangeA20006 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrangeA20006,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            11,
          ),
        ),
      );
  static ButtonStyle get fillDeeporangeA20006TL4 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrangeA20006,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      );
  static ButtonStyle get fillGray90003 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray90003,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
      );
  static ButtonStyle get fillGreen300 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.green300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
      );
  static ButtonStyle get fillTeal800 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.teal800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      );
  static ButtonStyle get fillTeal800TL7 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.teal800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
      );
  // Gradientnamedeeporange button style
  static ButtonStyle get gradientnamedeeporangeA20006nameprimary =>
      ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            28,
          ),
        ),
      );
  static BoxDecoration get gradientnamedeeporangeA20006nameprimaryDecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment(
            1.0,
            1,
          ),
          end: Alignment(
            -0.24,
            0,
          ),
          colors: [
            appTheme.deepOrangeA20006,
            theme.colorScheme.primary,
          ],
        ),
      );
  static ButtonStyle get gradientnamedeeporangeA20006nameprimaryTL15 =>
      ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      );
  static BoxDecoration
      get gradientnamedeeporangeA20006nameprimaryTL15Decoration =>
          BoxDecoration(
            borderRadius: BorderRadius.circular(
              getHorizontalSize(
                15.00,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment(
                1.0,
                1,
              ),
              end: Alignment(
                -0.24,
                0,
              ),
              colors: [
                appTheme.deepOrangeA20006,
                theme.colorScheme.primary,
              ],
            ),
          );
  // Outline button style
  static ButtonStyle get outlineBlack900 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.whiteA700,
        side: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
      );
  static ButtonStyle get outlineDeeporangeA20005 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.deepOrangeA20005,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
      );
  static ButtonStyle get outlineGray10001 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrangeA20001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
        shadowColor: appTheme.gray10001,
        elevation: 7,
      );
  static ButtonStyle get outlineGray30003 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.gray80004,
        side: BorderSide(
          color: appTheme.gray30003,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            3,
          ),
        ),
      );
  static ButtonStyle get outlineIndigoA1004c => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            28,
          ),
        ),
        shadowColor: appTheme.indigoA1004c,
        elevation: 10,
      );
  static BoxDecoration get outlineIndigoA1004cDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA1004c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(
            1.0,
            1,
          ),
          end: Alignment(
            -0.24,
            0,
          ),
          colors: [
            appTheme.deepOrangeA20006,
            theme.colorScheme.primary,
          ],
        ),
      );
  static ButtonStyle get outlineIndigoA1004cTL22 => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
        shadowColor: appTheme.indigoA1004c,
        elevation: 8,
      );
  static BoxDecoration get outlineIndigoA1004cTL22Decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            22.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA1004c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(
            1.0,
            1,
          ),
          end: Alignment(
            -0.24,
            0,
          ),
          colors: [
            appTheme.deepOrangeA20006,
            theme.colorScheme.primary,
          ],
        ),
      );
  static ButtonStyle get outlineIndigoA1004cTL28 => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            28,
          ),
        ),
        shadowColor: appTheme.indigoA1004c,
        elevation: 10,
      );
  static BoxDecoration get outlineIndigoA1004cTL28Decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA1004c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(
            1.0,
            1,
          ),
          end: Alignment(
            -0.24,
            0,
          ),
          colors: [
            theme.colorScheme.errorContainer,
            appTheme.cyan900,
          ],
        ),
      );
  // Radius button style
  static ButtonStyle get radiusTL28 => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            28,
          ),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
