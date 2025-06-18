import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import '../main.dart';

Future<Null> errorMessage({
  String? message,
  String? title,
  String? action,
  Function? onPressed,
  bool? isDismissible,
  Function? then,
}) {
  if (message == null) return Future.value(null);
  return Flushbar(
    margin: EdgeInsets.symmetric(horizontal: 18.w),
    borderRadius: BorderRadius.circular(10.r),
    messageText: Text(
      message,
      style: appTheme().textTheme.bodySmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    icon: const Icon(
      Icons.info,
      color: AppColors.white,
    ),
    backgroundColor: AppColors.error,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(appContext).then((value) {
    if (then != null) {
      then();
    }
  });
}

Future<Null> successMessage({
  String? message,
  String? title,
  String? action,
  Function? onPressed,
  bool? isDismissible,
  Function? then,
  IconData? icon,
}) {
  if (message == null) return Future.value(null);
  return Flushbar(
    margin: EdgeInsets.symmetric(horizontal: 18.w),
    borderRadius: BorderRadius.circular(10.r),
    messageText: Text(
      message ,
      style: appTheme().textTheme.bodySmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    icon: Icon(
      icon ?? Icons.check_circle,
      color: AppColors.white,
    ),
    backgroundColor: AppColors.primary,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(appContext).then((value) {
    if (then != null) {
      then();
    }
  });
}

