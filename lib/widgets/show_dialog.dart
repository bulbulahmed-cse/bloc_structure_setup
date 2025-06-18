
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/test_style.dart';
import '../main.dart';

Future errorDialog({
  String? message,
  String? title,
  String? action,
  Function? onPressed,
  bool? isDismissible,
}) {
  return showDialog(
    context: appContext,
    builder: (context) => AlertDialog(
      title: Text(title ?? "Error", style: titleTextStyle(),),
      titleTextStyle: Theme.of(appContext).textTheme.titleLarge,
      content: Text(message ?? "Something went wrong"),
      contentTextStyle: Theme.of(appContext).textTheme.bodyMedium,
      surfaceTintColor: Theme.of(appContext).scaffoldBackgroundColor,
      titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h).copyWith(top: 16.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      actions: [
        TextButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            action ?? 'OK',
            style: bodyTextStyle(),
          ),
        ),
      ],
    ),
    barrierDismissible: isDismissible ?? true,
  );
}

Future successDialog({
  String? message,
  String? title,
  String? action,
  Widget? content,
  Widget? actionWidget,
  Function()? onPressed,
  bool? isDismissible,
}) {
  return showDialog(
    context: appContext,
    builder: (context) => AlertDialog(
      content: content ??
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //SvgPicture.asset(Assets.iconsSuccess, width: 140.w, height: 140.h),
              20.verticalSpace,
              Text(
                title ?? "Success",
                style: titleTextStyle(),
                textAlign: TextAlign.center,
              ),
              16.verticalSpace,
              Text(
                message ?? "",
                style: bodyTextStyle(),
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
              actionWidget??TextButton(onPressed: (){
                if (onPressed != null) {
                  onPressed();
                } else {
                  //backPage();
                }
              }, child: Text(action ?? "ok",style: titleTextStyle(),),),
            ],
          ),

      contentTextStyle: Theme.of(appContext).textTheme.bodyMedium,
      surfaceTintColor: Theme.of(appContext).cardTheme.color,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    ),
    barrierDismissible: isDismissible ?? true,
  );
}


