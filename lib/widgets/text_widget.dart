
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  var text,color,font;
  double fsize;
  TextWidget({@required this.text,required this.color,required this.fsize,this.font});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(fontSize: fsize,color: color,fontWeight: font),);
  }
}
