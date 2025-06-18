import 'package:bloc_structure_setup/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.backgroundDark,
      error: AppColors.error,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundDark
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.backgroundDark,
      surfaceTintColor: AppColors.backgroundDark,
    ),
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    primaryColorLight: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    iconTheme: const IconThemeData(color: AppColors.textDark),
    dividerTheme: const DividerThemeData(
      color: AppColors.cardBorderColorDark,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primary),
      checkColor: WidgetStateProperty.all(AppColors.backgroundDark),
      side: const BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: AppColors.primary, // Customize the "OK" button text color
      backgroundColor: AppColors.primary.withOpacityFraction(.7),
      contentTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For iOS (dark icons)
        statusBarBrightness: Brightness.light, // For Android (light icons)
      ),
      elevation: 0,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.backgroundDark.withOpacityFraction(.3),
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppColors.textDark),
      titleTextStyle:  TextStyle(
          color: AppColors.textDark,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Urbanist',
        ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.backgroundDark,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textDark,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Urbanist',
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'Urbanist',
      ),
      menuStyle: MenuStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.cardBorderColorDark),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.backgroundDark),
        surfaceTintColor: WidgetStateProperty.all(AppColors.backgroundDark),
        elevation: WidgetStateProperty.all(5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primary.withOpacityFraction(.3),
      hintStyle: TextStyle(
        color: AppColors.hintColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'Urbanist',
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    ),
    cardColor: AppColors.cardColorDark,
    cardTheme: CardThemeData(
      shadowColor: AppColors.cardColorDark.withOpacityFraction(0.8),
      color: AppColors.cardColorDark,
      surfaceTintColor: AppColors.cardColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primary),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textDark,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      displayMedium: TextStyle(
        color: AppColors.textDark,
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      displaySmall: TextStyle(
        color: AppColors.textDark,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      headlineLarge: TextStyle(
        color: AppColors.textDark,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      headlineMedium: TextStyle(
        color: AppColors.textDark,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      headlineSmall: TextStyle(
        color: AppColors.textDark,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'Urbanist',
      ),
      titleLarge: TextStyle(
        color: AppColors.textDark,
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      titleMedium: TextStyle(
        color: AppColors.textDark,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      titleSmall: TextStyle(
        color: AppColors.textDark,
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      bodyLarge: TextStyle(
        color: AppColors.textDark,
        fontSize: 17.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'Urbanist',
      ),
      bodyMedium: TextStyle(
        color: AppColors.textDark,
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'Urbanist',
      ),
      bodySmall: TextStyle(
        color: AppColors.textDark,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
      ),
      labelLarge: TextStyle(
        color: AppColors.textDark,
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Urbanist',
      ),
      labelMedium: TextStyle(
        color: AppColors.textDark,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
      ),
      labelSmall: TextStyle(
        color: AppColors.textDark,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
      ),
    ),
  );
}


