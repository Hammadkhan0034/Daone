import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({
    Key? key,
    this.alignment,
    this.margin,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
    this.decoration,
    this.child,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final BoxDecoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: fabWidget,
          )
        : fabWidget;
  }

  Widget get fabWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: FloatingActionButton(
          shape:CircleBorder(),
          backgroundColor: backgroundColor,
          onPressed: onTap,
          child: Container(
            alignment: Alignment.center,
            width: getSize(width ?? 0),
            height: getSize(height ?? 0),
            decoration: decoration ??
                BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(
                  //   getHorizontalSize(
                  //     25.00,
                  //   ),
                  //),
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
                ),
            child: child,
          ),
        ),
      );
}
