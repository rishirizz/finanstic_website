import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

TextStyle headerTextStyleMobile(BuildContext context) {
  return GoogleFonts.prompt(
    fontWeight: FontWeight.w400,
    fontSize: 35 * getTextScaleFactor(context),
    color: Colors.black,
  );
}

TextStyle headerTextStyleDesktop(BuildContext context) {
  return GoogleFonts.prompt(
    fontWeight: FontWeight.w400,
    fontSize: 80 * getTextScaleFactor(context),
    color: Colors.black,
  );
}

TextStyle primaryTextStyle(BuildContext context) {
  return GoogleFonts.prompt(
    fontSize: 20 * getTextScaleFactor(context),
    color: Colors.black,
  );
}

TextStyle h2TextStyle(BuildContext context) {
  return GoogleFonts.prompt(
    fontSize: 26 * getTextScaleFactor(context),
    color: Colors.black,
    decoration: TextDecoration.underline,
    decorationColor: decorationColor,
  );
}

TextStyle paragraphTextStyle(BuildContext context) {
  return GoogleFonts.montserrat(
    fontSize: 20 * getTextScaleFactor(context),
    color: paragraphColor,
  );
}

TextStyle footerTextStyle(BuildContext context) {
  return GoogleFonts.shadowsIntoLight(
    fontSize: 25 * getTextScaleFactor(context),
    color: Colors.white,
  );
}
