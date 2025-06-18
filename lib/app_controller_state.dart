import 'package:bloc_structure_setup/core/storage/storage_service.dart';
import 'package:flutter/material.dart';

import '../../di/dependency.dart';

class AppControllerState {
  Locale locale = const Locale('en');
  bool? isIgnore;

  AppControllerState({this.locale = const Locale('en'), this.isIgnore});

  Iterable<Locale> supportedLocales = [
    const Locale('en'),
  ];

  Locale? localeResolutionCallBack(List<Locale>? locales, Iterable<Locale> supportedLocale) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locales?.first.languageCode &&
          supportedLocale.countryCode == locales?.first.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocale.first;
  }

  Future<AppControllerState> inti() async {

    locale = Locale(await instance<StorageService>().getLanguage());
    print('AppControllerState.inti $locale');
   return this;
  }

  AppControllerState copyWith({Locale? locale, bool? isIgnore}) {
    if (locale != null) {
      instance<StorageService>().setLanguage(locale.languageCode);
    }
    return AppControllerState(
        locale: locale ?? this.locale,
    isIgnore: isIgnore ?? this.isIgnore);
  }
}
