import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeConfig {
  SliderThemeData sliderTheme = SliderThemeData(
    thumbColor: AppColors.primary,
    inactiveTickMarkColor: Colors.transparent,
    activeTickMarkColor: AppColors.primary,
    inactiveTrackColor: AppColors.background,
    trackHeight: 5.0,
    overlayColor: AppColors.primary.withOpacity(0.5),
    overlappingShapeStrokeColor: Colors.amber,
    valueIndicatorColor: AppColors.primary,
    activeTrackColor: AppColors.primary,
    trackShape: CustomTrackShape(),
  );

  CheckboxThemeData checkboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(AppColors.primary),
  );

  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
  );

  TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(AppColors.primary),
      overlayColor: MaterialStateProperty.all(AppColors.primaryAccent),
    ),
  );

  ThemeData get defaultConfig => ThemeData(
        primaryColor: AppColors.primary,
        focusColor: AppColors.primary,
        splashColor: AppColors.primaryAccent,
        dividerColor: Colors.transparent,
        checkboxTheme: checkboxTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonTheme,
        sliderTheme: sliderTheme,
        fontFamily: 'SpaceGrotesk',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.materialPrimary,
        ).copyWith(secondary: AppColors.primaryAccent),
      );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox? parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData? sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme?.trackHeight ?? 0.0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox?.size.height ?? 0.0 - trackHeight) / 2;
    final double trackWidth = parentBox?.size.width ?? 0.0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
