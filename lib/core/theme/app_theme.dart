import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors - Classic Film Inspired
  static const Color primaryColor = Color(0xFF222222); // Dark gray/almost black
  static const Color secondaryColor = Color(0xFFE6CCA0); // Vintage beige
  static const Color accentColor = Color(0xFF8D4A4A); // Vintage red
  static const Color backgroundColor = Color(0xFFF7ECD1); // Light beige
  static const Color surfaceColor = Color(0xFFE6CCA0); // Beige
  static const Color textColorPrimary = Color(0xFF111111); // Nearly black
  static const Color textColorSecondary = Color(0xFF555555); // Dark gray
  static const Color humanColor = Color(0xFF486B6B); // Vintage teal
  static const Color aiColor = Color(0xFF8D4A4A); // Vintage red
  static const Color hybridColor = Color(0xFF5A4A72); // Vintage purple
  
  // Text Styles - Film Inspired Typography
  static TextStyle get headingStyle => GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textColorPrimary,
        letterSpacing: 0.5,
      );

  static TextStyle get subheadingStyle => GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColorPrimary,
        letterSpacing: 0.3,
      );

  static TextStyle get bodyStyle => GoogleFonts.lato(
        fontSize: 16,
        color: textColorPrimary,
        letterSpacing: 0.2,
      );

  static TextStyle get captionStyle => GoogleFonts.lato(
        fontSize: 14,
        color: textColorSecondary,
      );

  // ThemeData
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        background: backgroundColor,
        error: aiColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: secondaryColor,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: headingStyle,
        displayMedium: subheadingStyle,
        bodyLarge: bodyStyle,
        bodyMedium: captionStyle,
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: backgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(color: textColorSecondary),
      ),
    );
  }

  static ThemeData get lightTheme => darkTheme; // We'll use the same theme for both
}
