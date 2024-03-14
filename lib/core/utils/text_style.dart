import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getTextStyle(
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColoes.primary,
  );
}

TextStyle getBodyStyle(
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColoes.black,
  );
}

TextStyle getSmallStyle(
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColoes.grey,
  );
}
