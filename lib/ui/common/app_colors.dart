import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor materialPrimary = MaterialColor(
    0xFF00704A,
    <int, Color>{
      50: Color(0xFF0E7AC7),
      100: Color(0xFF0E7AC7),
      200: Color(0xFF0E7AC7),
      300: Color(0xFF0E7AC7),
      400: Color(0xFF0E7AC7),
      500: Color(0xFF0E7AC7),
      600: Color(0xFF0E7AC7),
      700: Color(0xFF0E7AC7),
      800: Color(0xFF0E7AC7),
      900: Color(0xFF0E7AC7),
    },
  );

  static const Color primary = Color(0xFF00704A);
  static const Color primaryAccent = Color(0xFFF2C94C);
  static const Color primaryLight = Color(0xFF867AD2);
  static const Color primaryDark = Color(0xFF2F2C44);

  static const Color background = Color(0xFF1C1A29);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFF5F5F5);
  static const Color whiteBackground = Color(0xFFFAFAFA);
  static const Color grey = Color(0xFFDADADA);
  static const Color greySoft = Color(0xFFEDEDED);
  static const Color disableTextField = Color(0xFFD9D9D9);
  static const Color disable = Color(0xFFC2C2C2);

  static const Color field = Color(0xFFEDEDED);
  static const Color baseColorShimmer = Color(0xFFEDEDED);
  static Color highlightColorShimmer = const Color(0xFFEDEDED).withOpacity(0.5);

  const AppColors._();
}
