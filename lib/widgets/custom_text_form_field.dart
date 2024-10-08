import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({

    Key? key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.textStyle,

    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.fillColor,
    this.filled = false,
    this.contentPadding,
    this.defaultBorderDecoration,
    this.enabledBorderDecoration,
    this.focusedBorderDecoration,
    this.disabledBorderDecoration,
    this.validator,
    this.function,  this.autofocus=false,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;
final  bool autofocus;


  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final Color? fillColor;

  final bool? filled;

  final EdgeInsets? contentPadding;

  final InputBorder? defaultBorderDecoration;

  final InputBorder? enabledBorderDecoration;

  final InputBorder? focusedBorderDecoration;

  final InputBorder? disabledBorderDecoration;

  final FormFieldValidator<String>? validator;

  var function;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: TextFormField(
          onSaved: function,
          controller: controller,
          focusNode: focusNode ,
          style: textStyle,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator ?? (value) {
            if(value==null||value.isEmpty || value=='') return "This field is required";
            return null;

          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        fillColor: fillColor,
        filled: filled,
        isDense: true,
        contentPadding: contentPadding,
        border: defaultBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  14.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.gray50,
                width: 1,
              ),
            ),
        enabledBorder: enabledBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  14.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.gray50,
                width: 1,
              ),
            ),
        focusedBorder: focusedBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  14.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.gray50,
                width: 1,
              ),
            ),
        disabledBorder: disabledBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  14.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.gray50,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineGray40001 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.gray40001,
          width: 2,
        ),
      );
  static UnderlineInputBorder get underLineGray30003 => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray30003,
        ),
      );
  static UnderlineInputBorder get underLineIndigo50 => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.indigo50,
        ),
      );
  static OutlineInputBorder get outlineGray30003 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            3.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.gray30003,
          width: 1,
        ),
      );
  static OutlineInputBorder get fillWhiteA700 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            17.00,
          ),
        ),
        borderSide: BorderSide.none,
      );
}
