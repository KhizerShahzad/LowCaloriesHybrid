import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:lowcalories/Utills/AppColors.dart';

class AppStyles {
  static final AppStyles _AppStyles = AppStyles._privateConstructor();

  factory AppStyles() => _AppStyles;

  AppStyles._privateConstructor();

  fontInter500(double fontSize) {
    return  TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: Color(AppColors().titleTextColor));
  }
  fontInterBold(double fontSize) {
    return  TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: Color(AppColors().titleTextColor));
  }

}
