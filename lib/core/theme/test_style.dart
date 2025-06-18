import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

TextStyle displayTextStyle({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.displayLarge!.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: color,
  );
}
TextStyle titleTextStyle({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.titleLarge!.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: color,
  );
}
TextStyle bodyTextStyle({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color,
  );
}
TextStyle bodyTextStyleCG({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyMedium!.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color,
  );
}
TextStyle labelTextStyle({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.labelLarge!.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: color,
  );
}


TextStyle labelBoldTextStyle({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.bodyLarge!.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}
TextStyle smallTextStyle({BuildContext? context, Color? color}) {
  return Theme.of(context??appContext).textTheme.labelSmall!.copyWith(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: color,
  );
}