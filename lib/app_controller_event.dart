
import 'package:flutter/material.dart';

abstract class AppControllerEvent {}

class InitAppEvent extends AppControllerEvent {}
class ChangeLanguage extends AppControllerEvent {
  bool? isLogOut;
  Locale locale;
  String appLanguage;

  ChangeLanguage(this.locale, this.appLanguage,{this.isLogOut = false});
}

class ChangeIgnoresSafeArea extends AppControllerEvent {
  bool ignoreSafeArea;

  ChangeIgnoresSafeArea(this.ignoreSafeArea);
}