import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006D35),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF68FE99),
    onPrimaryContainer: Color(0xFF00210C),
    secondary: Color(0xFF506352),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD3E8D2),
    onSecondaryContainer: Color(0xFF0E1F12),
    tertiary: Color(0xFF00687A),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFABEDFF),
    onTertiaryContainer: Color(0xFF001F26),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFCFDF7),
    onBackground: Color(0xFF191C19),
    surface: Color(0xFFFCFDF7),
    onSurface: Color(0xFF191C19),
    surfaceVariant: Color(0xFFDDE5DA),
    onSurfaceVariant: Color(0xFF414941),
    outline: Color(0xFF717970),
    onInverseSurface: Color(0xFFF0F1EC),
    inverseSurface: Color(0xFF2E312E),
    inversePrimary: Color(0xFF46E17F),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006D35),
    outlineVariant: Color(0xFFC1C9BF),
    scrim: Color(0xFF000000),
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF46E17F),
    onPrimary: Color(0xFF003919),
    primaryContainer: Color(0xFF005226),
    onPrimaryContainer: Color(0xFF68FE99),
    secondary: Color(0xFFB7CCB7),
    onSecondary: Color(0xFF233426),
    secondaryContainer: Color(0xFF394B3B),
    onSecondaryContainer: Color(0xFFD3E8D2),
    tertiary: Color(0xFF41D7F7),
    onTertiary: Color(0xFF003640),
    tertiaryContainer: Color(0xFF004E5C),
    onTertiaryContainer: Color(0xFFABEDFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C19),
    onBackground: Color(0xFFE2E3DE),
    surface: Color(0xFF191C19),
    onSurface: Color(0xFFE2E3DE),
    surfaceVariant: Color(0xFF414941),
    onSurfaceVariant: Color(0xFFC1C9BF),
    outline: Color(0xFF8B938A),
    onInverseSurface: Color(0xFF191C19),
    inverseSurface: Color(0xFFE2E3DE),
    inversePrimary: Color(0xFF006D35),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF46E17F),
    outlineVariant: Color(0xFF414941),
    scrim: Color(0xFF000000),
  );

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ThemeConfig.lightColorScheme,
      textTheme: GoogleFonts.interTextTheme());

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ThemeConfig.darkColorScheme,
      textTheme: GoogleFonts.interTextTheme());
}
