import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: IconButton(
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          iconSize: getSize(height ?? 0),
          padding: EdgeInsets.all(0),
          icon: Container(
            alignment: Alignment.center,
            width: getSize(width ?? 0),
            height: getSize(height ?? 0),
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.deepOrangeA20005,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      14.00,
                    ),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: appTheme.gray10001,
                  //     spreadRadius: getHorizontalSize(
                  //       2.00,
                  //     ),
                  //     blurRadius: getHorizontalSize(
                  //       2.00,
                  //     ),
                  //     offset: Offset(
                  //       -3,
                  //       7,
                  //     ),
                  //   ),
                  // ],
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineGray300 => BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        ),
        border: Border.all(
          color: appTheme.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillIndigoA10002 => BoxDecoration(
        color: appTheme.indigoA10002,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        ),
      );
  static BoxDecoration get fillCyan200 => BoxDecoration(
        color: appTheme.cyan200,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        ),
      );
  static BoxDecoration get fillRed30002 => BoxDecoration(
        color: appTheme.red30002,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        ),
      );
  static BoxDecoration get fillIndigoA10002TL8 => BoxDecoration(
        color: appTheme.indigoA10002,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        ),
      );
  static BoxDecoration get fillGreenA100 => BoxDecoration(
        color: appTheme.greenA100,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            7.00,
          ),
        ),
      );
  static BoxDecoration get outlineGray40002 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            2.00,
          ),
        ),
        border: Border.all(
          color: appTheme.gray40002,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillDeeporangeA20006 => BoxDecoration(
        color: appTheme.deepOrangeA20006.withOpacity(0.39),
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        ),
      );
  static BoxDecoration get fillGray50001 => BoxDecoration(
        color: appTheme.gray50001.withOpacity(0.39),
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        ),
      );
  static BoxDecoration get fillDeeporangeA20001 => BoxDecoration(
        color: appTheme.deepOrangeA20001,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        ),
      );
  static BoxDecoration get fillTeal300 => BoxDecoration(
        color: appTheme.teal300,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            11.00,
          ),
        ),
      );
  static BoxDecoration get outlineWhiteA700 => BoxDecoration(
        color: appTheme.gray30001,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            13.00,
          ),
        ),
        border: Border.all(
          color: appTheme.whiteA700,
          width: getHorizontalSize(
            1.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
}
