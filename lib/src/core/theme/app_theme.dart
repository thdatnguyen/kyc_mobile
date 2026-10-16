import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// PPAC Official Brand Palette
/// Domain: https://ppac.co.uk/
class Colours {
  /// Dark Green - Primary PPAC brand color (#164400)
  static const primary = Color(0xFF164400);

  /// Brand Green (#026220)
  static const brandGreen = Color(0xFF026220);

  /// Secondary Green (#318B2E)
  static const brandGreenSecond = Color(0xFF318B2E);

  /// Neon Accent Green (#D0FF55)
  static const brandNeon = Color(0xFFD0FF55);

  /// Light Green / Accent (#E6FFB0)
  static const brandLight = Color(0xFFE6FFB0);

  /// Beige / Cream (#F4FFE2)
  static const brandBeige = Color(0xFFF4FFE2);

  /// Super Light Green / Soft Canvas (#FBFFF8)
  static const background = Color(0xFFFBFFF8);

  static const onPrimary = Colors.white;
  static const surface = Colors.white;
  static const error = Color(0xFFDC2626);
  static const success = Color(0xFF026220);
  static const warning = Color(0xFFD97706);
  static const textPrimary = Color(0xFF0A0A0A);
  static const textSecondary = Color(0xFF4B5563);
  static const outline = Color(0xFFE5E7EB);
}

class AppTheme {
  static ThemeData get light {
    final baseTheme = ThemeData.light(useMaterial3: true);

    // Apply Inter as default body/UI font family across all text styles
    final interTextTheme = GoogleFonts.interTextTheme(baseTheme.textTheme);

    // Apply Unbounded for display and headline/title typography
    final customTextTheme = interTextTheme.copyWith(
      displayLarge: GoogleFonts.unbounded(
        textStyle: interTextTheme.displayLarge?.copyWith(
          color: Colours.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      displayMedium: GoogleFonts.unbounded(
        textStyle: interTextTheme.displayMedium?.copyWith(
          color: Colours.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      displaySmall: GoogleFonts.unbounded(
        textStyle: interTextTheme.displaySmall?.copyWith(
          color: Colours.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      headlineLarge: GoogleFonts.unbounded(
        textStyle: interTextTheme.headlineLarge?.copyWith(
          color: Colours.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineMedium: GoogleFonts.unbounded(
        textStyle: interTextTheme.headlineMedium?.copyWith(
          color: Colours.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineSmall: GoogleFonts.unbounded(
        textStyle: interTextTheme.headlineSmall?.copyWith(
          color: Colours.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      titleLarge: GoogleFonts.unbounded(
        textStyle: interTextTheme.titleLarge?.copyWith(
          color: Colours.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      titleMedium: GoogleFonts.inter(
        textStyle: interTextTheme.titleMedium?.copyWith(
          color: Colours.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      bodyLarge: GoogleFonts.inter(
        textStyle: interTextTheme.bodyLarge?.copyWith(
          color: Colours.textPrimary,
        ),
      ),
      bodyMedium: GoogleFonts.inter(
        textStyle: interTextTheme.bodyMedium?.copyWith(
          color: Colours.textSecondary,
        ),
      ),
    );

    final scheme = ColorScheme.fromSeed(
      seedColor: Colours.primary,
      primary: Colours.primary,
      secondary: Colours.brandGreen,
      tertiary: Colours.brandNeon,
      error: Colours.error,
      surface: Colours.surface,
    );

    return baseTheme.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: Colours.background,
      textTheme: customTextTheme,
      primaryTextTheme: customTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colours.background,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        titleTextStyle: GoogleFonts.unbounded(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colours.primary,
        ),
        iconTheme: const IconThemeData(color: Colours.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colours.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colours.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colours.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colours.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colours.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colours.primary,
          foregroundColor: Colours.onPrimary,
          minimumSize: const Size.fromHeight(52),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colours.primary,
          minimumSize: const Size.fromHeight(52),
          side: const BorderSide(color: Colours.primary, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colours.primary,
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
