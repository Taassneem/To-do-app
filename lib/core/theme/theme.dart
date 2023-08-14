import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_color.dart';

ThemeData getThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
            fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.white),
        displayMedium: GoogleFonts.lato(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        displaySmall: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white),
        bodyMedium: GoogleFonts.lato(
            fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
        bodySmall: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.white.withOpacity(.44)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white),
          fillColor: AppColors.deeoGrey,
          filled: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.border)),
          contentPadding: const EdgeInsets.only(left: 15),
          focusedBorder: const OutlineInputBorder()));
}
