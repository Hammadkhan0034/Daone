
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  var text, color, font, textAlign, softWrap,fontFamily;
  double fsize;

  TextWidget({
    @required this.text,
    this.color = Colors.black,
    this.fsize = 14.0,
    this.font,
    this.textAlign,
    this.softWrap,
    this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fsize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: font,
        overflow: TextOverflow.ellipsis
      ),
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
