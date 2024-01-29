import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF212121);
const Color primaryColor = Color(0xFF0077B6);
const Color secondaryColor = Color(0xFF80BBDB);
const Color thirdColor = Color(0xFFC0DDED);
const Color forthColor = Color(0xFFE0EEF6);

const Color greyColor0 = Color(0xFFFFFFFF);
const Color greyColor1 = Color(0xFFD9D9D9);
const Color greyColor2 = Color(0xFFC4C4C4);
const Color greyColor3 = Color(0xFF979797);

const Color blueColor1 = Color(0xFF283766);
const Color yellowColor1 = Color(0xFFFFD44A);
const Color redColor1 = Color(0xFFCD5E74);
const Color redColor2 = Color(0xFFFF3A3A);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),

  // Headline
  headlineLarge: GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),

  // Title
  titleLarge: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),

  // Body
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),

  // Label
  labelLarge: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  labelMedium: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  labelSmall: GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
