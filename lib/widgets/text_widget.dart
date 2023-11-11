
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  var text, color, font, textAlign, softWrap;
  double fsize;

  TextWidget({
    @required this.text,
    this.color = Colors.black,
    this.fsize = 14.0,
    this.font,
    this.textAlign,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fsize,
        color: color,
        fontWeight: font,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
