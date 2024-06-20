import 'package:flutter/material.dart';

class AppSizes {
  static final AppSizes _appSizes = AppSizes._privateConstructor();

  factory AppSizes() => _appSizes;

  AppSizes._privateConstructor();

  paddingWidthPoint3(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.03;
  }
  paddingHeightPoint3(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }
  paddingHeightPoint6(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }
  paddingHeightPoint1(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }
  paddingWidthPoint2(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.005;
  }
  SectionSeprationSpace(BuildContext context) {
    return MediaQuery.of(context).size.height*0.04;
  }
  GoalSelectionTop(BuildContext context) {
    return  MediaQuery.of(context).size.height*0.012;
  }
  spaceBetweenItems(BuildContext context) {
    return  MediaQuery.of(context).size.height*0.019;
  }
  spaceBetweenItemsHorizontal(BuildContext context) {
    return  MediaQuery.of(context).size.width*0.019;
  }
}
