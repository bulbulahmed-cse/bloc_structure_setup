import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;

  bool get isSingular => this >= 0 && this <= 1;
}

extension NounsExtensions on num? {
  String get toReadableDay => (this ?? 0) > 1 ? '$this Days' : '$this Day';
}

extension StringCasingExtension on String {
  String get currencySymbol{
    var format = NumberFormat.simpleCurrency(name: this);
    return format.currencySymbol;
  }
  String get emailSubstring {
    if (isEmpty) return this;

    int atIndex = indexOf('@');

    return replaceRange(0, (atIndex-(atIndex > 2 ?2:0)), List.generate(atIndex, (_) => '*').join());
  }

  String get toCapitalized => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized).join(' ');

  String get toSpaceCase => replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}').trim();

  bool get isEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  List<String> get toList {
    List<String> list = [];
    try {
      json.decode(this).forEach((v) {
        list.add(v.toString());
      });
    } catch (e) {
      list.add(this);
    }
    return list;
  }

  String replaceEmail(int start) {
    if (isEmpty) return this;

    String email = substring(0, start);
    for (int i = start; i < length; i++) {
      if (this[i] != '@') {
        email += '*';
      } else {
        email += '@';
      }
    }
    return email;
  }

  String replacePhoneNumber(int first, [int last = 0]) {
    if (isEmpty) return this;

    return replaceRange(first, length - last, List.generate((length - (last + first)), (_) => '*').join());
  }
}

extension DateExtensions on String? {
  String get formattedDate => DateFormat('yyyy-MM-dd').format(DateTime.parse(this ?? ""));

  int get toVersion => this == null ? 0 : int.parse(this!.replaceAll('.', ''));

  String get formattedDateTime =>
      this == null || this == "" ? "" : DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(this ?? ""));
}

extension DoubleExtensions on num? {
  String toSignificantDigits() {
    if (this == null) return "0.00";
    int iValue = (this ?? 0).toInt();
    String str = ((this ?? 0) - iValue).toString().replaceFirst("0.", "");
    int nonZeroIndex = str.indexOf(RegExp(r'[1-9]'));
    if (nonZeroIndex == -1) return iValue.toString(); // If no non-zero digit is found, return '0'

    int endIndex = nonZeroIndex + 2;
    if (endIndex >= str.length) endIndex = str.length;

    String result = str.substring(0, endIndex);
    if (result.endsWith('0')) {
      result = str.substring(0, endIndex + 1);
    }
    return "$iValue.$result";
  }
}

extension ColorOpacityExtension on Color {
  Color withOpacityFraction(double opacity) {
    return withAlpha((opacity * 255).round().clamp(0, 255));
  }
}
