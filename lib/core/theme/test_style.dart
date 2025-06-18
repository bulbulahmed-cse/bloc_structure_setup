import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import 'app_colors.dart';

TextStyle bodyTextStyleF14({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: color,
  );
}

TextStyle bodyTextStyleF14_2({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyMedium!.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: color,
  );
}
TextStyle bodyTextStyleF12_2({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyMedium!.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: color,
  );
}

TextStyle disableTextStyle({BuildContext? context, Color? color,double? fontSize}) {
  return Theme.of(context??appContext).textTheme.bodyMedium!.copyWith(
    fontSize: fontSize??10.sp,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.lineThrough,
    color: color,
  );
}

TextStyle titleTextStyleF24({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle titleTextStyleF18({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle titleTextStyleF14({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}
TextStyle titleTextStyleF12({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}
TextStyle titleTextStyleF16({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle subtitleTextStyle({BuildContext? context,Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: color,
  );
}

TextStyle smallTextStyle({BuildContext? context, Color? color, FontWeight? fontWeight}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 10.sp,
    fontWeight: fontWeight??FontWeight.w600,
    color: color,
  );
}
TextStyle smallTextStyle2({BuildContext? context}) {
  return Theme.of(context??appContext).textTheme.bodyMedium!.copyWith(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );
}

TextStyle buttonTextStyle({BuildContext? context, Color? color, double? fontSize}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: fontSize??16.sp,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.white,
  );
}

TextStyle buttonTextStyle2({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.black,
  );
}