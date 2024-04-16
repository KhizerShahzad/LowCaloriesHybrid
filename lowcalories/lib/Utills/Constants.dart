import 'dart:convert';
import 'package:flutter/material.dart';

class Constants {
  static final Constants _AppColors = Constants._privateConstructor();

  factory Constants() => _AppColors;

  Constants._privateConstructor();

  paddingFrontPoint3(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.03;
  }
  GoalSelectionTop(BuildContext context) {
    return  MediaQuery.of(context).size.height*0.012;
  }
  spaceBetweenItems(BuildContext context) {
    return  MediaQuery.of(context).size.height*0.012;
  }
}
