import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Views/CommonWidgets/DecoratedTextFieldWithoutUnit.dart';

class MapSelectionInput extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";

  var imagePath = "";
  MapChangeNotifier notifier;
  TextEditingController controller;


  MapSelectionInput(
      {super.key,
      required this.notifier,
      required this.imagePath,
      required this.fieldText,
      required this.fieldHint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes().spaceBetweenItems(context)),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.5,
          color: Color(AppColors().itemShadow),
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width*0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(AppColors().itemBack),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppSizes().paddingWidthPoint2(context)),
                        child: DecoratedTextFieldWithoutFieldUnit(
                            fieldHint, "", controller),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
