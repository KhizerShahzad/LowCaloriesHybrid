import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:lowcalories/Utills/AppColors.dart';

class AppStyles {
  static final AppStyles _AppStyles = AppStyles._privateConstructor();

  factory AppStyles() => _AppStyles;

  AppStyles._privateConstructor();

  fontInter500(double fontSize) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: Color(AppColors().titleTextColor));
  }
  fontRobotoWeight400(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        color: Color(AppColors().titleTextColor));
  }
  fontRobotoWeight500(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        color: Color(AppColors().titleTextColor));
  }
  fontRobotoWeightBold(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        color: Color(AppColors().titleTextColor));
  }
  fontRobotoWeight300(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        color: Color(AppColors().titleTextColor));
  }

  fontInter500Color(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: textColor);
  }

  fontInterBoldColor(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: textColor);
  }

  fontInter400(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: textColor);
  }

  fontInterItalic(double fontSize) {
    return TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: Color(AppColors().titleTextColor));
  }

  fontInterBold(double fontSize) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Inter_bold',
        color: Color(AppColors().titleTextColor));
  }
  fontInterMedium(double fontSize, Color textColor) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Inter_medium',
        color: textColor);
  }
}
