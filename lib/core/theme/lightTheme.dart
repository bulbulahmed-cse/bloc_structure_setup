import 'package:bloc_structure_setup/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.backgroundLight,
      error: AppColors.error,
    ),
    dialogTheme: DialogThemeData(
        backgroundColor: AppColors.backgroundLight
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.backgroundLight,
      surfaceTintColor: AppColors.backgroundLight,
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    primaryColorLight: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    iconTheme: const IconThemeData(color: AppColors.textLight),
    dividerTheme: const DividerThemeData(
      color: AppColors.cardBorderColorLight,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primary),
      checkColor: WidgetStateProperty.all(AppColors.backgroundLight),
      side: const BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: AppColors.primary, // Customize the "OK" button text color
      backgroundColor: AppColors.primary.withOpacityFraction(.7),
      contentTextStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
      elevation: 0,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.backgroundLight.withOpacityFraction(.3),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.textLight),
      titleTextStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textLight,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.primary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      menuStyle: MenuStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.cardBorderColorLight),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.backgroundLight),
        surfaceTintColor: WidgetStateProperty.all(AppColors.backgroundLight),
        elevation: WidgetStateProperty.all(5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundLight,
      floatingLabelStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      hintStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.hintColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      labelStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      errorStyle: GoogleFonts.plusJakartaSans(
        color: AppColors.error,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.cardBorderColorLight,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.cardBorderColorLight,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
    ),
    cardColor: AppColors.cardColorLight,
    cardTheme: CardThemeData(
      shadowColor: AppColors.cardColorLight.withOpacityFraction(0.8),
      color: AppColors.cardColorLight,
      surfaceTintColor: AppColors.cardColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primary),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        color: AppColors.hintColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.plusJakartaSans(
        color: AppColors.textLight,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
