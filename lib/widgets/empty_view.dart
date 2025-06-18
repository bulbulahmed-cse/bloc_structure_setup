import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../core/theme/test_style.dart';



class EmptyView extends StatelessWidget {
  final String? image;
  final String? message;
  final String? title;
  final String? actionMessage;
  final double? height;
  final GestureTapCallback? action;
  const EmptyView({super.key,
    this.image,
    this.message,
    this.title,
    this.actionMessage,
    this.height,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: height ?? 1.sh,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null
                ? SvgPicture.asset(
              image!,
              height: 50.h,
              width: 50.w,
            )
                : const SizedBox(),
            if (title != null)
              Column(
                children: [
                  10.verticalSpace,
                  Text(
                    title!,
                    style: bodyTextStyleCG(),
                  ),
                  10.verticalSpace,
                ],
              ),
          ],
        ),
      ),
    );
  }
}

