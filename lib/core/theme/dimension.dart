import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class Dimension{
  static FontWeight textRegular=FontWeight.w400;
  static FontWeight textMedium=FontWeight.w500;
  static FontWeight textSemiMedium=FontWeight.w600;
  static FontWeight textBold=FontWeight.w700;

  static double get paddingTop=>MediaQuery.of(appContext).padding.top;
  static double get paddingBottom=>MediaQuery.of(appContext).padding.bottom;
  static double get appbarHeight => AppBar(title: Text("")).preferredSize.height;
  static Widget get bottomSpace => (paddingBottom+16.h).verticalSpace;
}