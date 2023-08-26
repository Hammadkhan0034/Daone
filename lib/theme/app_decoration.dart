import 'package:flutter/material.dart';
import 'package:daone/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get txtFill4 => BoxDecoration(
        color: appTheme.red300,
      );
  static BoxDecoration get txtFill3 => BoxDecoration(
        color: appTheme.red100,
      );
  static BoxDecoration get txtFill2 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get txtFill1 => BoxDecoration(
        color: appTheme.deepOrangeA20002,
      );
  static BoxDecoration get txtFill => BoxDecoration(
        color: appTheme.deepOrangeA20005,
      );
  static BoxDecoration get gradientnamedeeporange300namedeeporangeA200 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            1,
          ),
          end: Alignment(
            1,
            0,
          ),
          colors: [
            appTheme.deepOrange300,
            appTheme.deepOrangeA200,
          ],
        ),
      );
  static BoxDecoration get outline10 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray30003,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline11 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outline12 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.indigo100,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline13 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.indigo100,
          width: getHorizontalSize(
            1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get txtOutline => BoxDecoration(
        border: Border.all(
          color: appTheme.gray40001,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get outline14 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.deepOrangeA20006,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline15 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              6,
            ),
          ),
        ],
      );
  static BoxDecoration get outline16 => BoxDecoration(
        color: appTheme.gray5001,
        border: Border.all(
          color: appTheme.gray400,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline => BoxDecoration(
        border: Border.all(
          color: appTheme.gray50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fill9 => BoxDecoration(
        color: appTheme.deepOrangeA20001,
      );
  static BoxDecoration get fill8 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration
      get gradientnameerrorContaineropacity042namecyan900opacity042 =>
          BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                1,
                1,
              ),
              end: Alignment(
                -0.24,
                -0.31,
              ),
              colors: [
                theme.colorScheme.errorContainer.withOpacity(0.42),
                appTheme.cyan900.withOpacity(0.42),
              ],
            ),
          );
  static BoxDecoration get outline2 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimary,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get fill5 => BoxDecoration(
        color: appTheme.cyan200.withOpacity(0.25),
      );
  static BoxDecoration get outline1 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.deepOrangeA20001.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get fill4 => BoxDecoration(
        color: appTheme.indigoA10002.withOpacity(0.25),
      );
  static BoxDecoration get outline4 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray30003.withOpacity(0.87),
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fill7 => BoxDecoration(
        color: appTheme.indigo5001,
      );
  static BoxDecoration get outline3 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray40001,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get fill6 => BoxDecoration(
        color: appTheme.deepOrange503f,
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get outline6 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fill12 => BoxDecoration(
        color: appTheme.blueGray5001,
      );
  static BoxDecoration get outline5 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.red1007f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get fill11 => BoxDecoration(
        color: appTheme.gray20001,
      );
  static BoxDecoration get fill3 => BoxDecoration(
        color: appTheme.deepOrangeA20005,
      );
  static BoxDecoration get outline8 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimary,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              9.21,
            ),
          ),
        ],
      );
  static BoxDecoration get fill2 => BoxDecoration(
        color: appTheme.blue10001,
      );
  static BoxDecoration get outline7 => BoxDecoration(
        color: appTheme.deepOrangeA20002,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fill13 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get outline9 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.deepOrangeA20001.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      );
  static BoxDecoration get fill10 => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get txtOutline1 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray30003,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderBL15 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        15,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        15,
      ),
    ),
  );

  static BorderRadius txtCircleBorder7 = BorderRadius.circular(
    getHorizontalSize(
      7,
    ),
  );

  static BorderRadius circleBorder37 = BorderRadius.circular(
    getHorizontalSize(
      37,
    ),
  );

  static BorderRadius roundedBorder18 = BorderRadius.circular(
    getHorizontalSize(
      18,
    ),
  );

  static BorderRadius txtRoundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius circleBorder33 = BorderRadius.circular(
    getHorizontalSize(
      33,
    ),
  );

  static BorderRadius roundedBorder14 = BorderRadius.circular(
    getHorizontalSize(
      14,
    ),
  );

  static BorderRadius circleBorder25 = BorderRadius.circular(
    getHorizontalSize(
      25,
    ),
  );

  static BorderRadius circleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30,
    ),
  );

  static BorderRadius roundedBorder3 = BorderRadius.circular(
    getHorizontalSize(
      3,
    ),
  );

  static BorderRadius roundedBorder22 = BorderRadius.circular(
    getHorizontalSize(
      22,
    ),
  );

  static BorderRadius roundedBorder11 = BorderRadius.circular(
    getHorizontalSize(
      11,
    ),
  );

  static BorderRadius roundedBorder42 = BorderRadius.circular(
    getHorizontalSize(
      42,
    ),
  );

  static BorderRadius circleBorder60 = BorderRadius.circular(
    getHorizontalSize(
      60,
    ),
  );

  static BorderRadius txtRoundedBorder3 = BorderRadius.circular(
    getHorizontalSize(
      3,
    ),
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
    