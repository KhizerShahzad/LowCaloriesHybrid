import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';

class TextFieldDecoratedWithoutImage extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";
  GoalSelectionScreenNotifier notifier;
  TextEditingController controller;
  String fieldUnit = "";
  bool isPasswordField = false;

  TextFieldDecoratedWithoutImage(
      {super.key,
      required this.notifier,
      required this.fieldText,
      required this.fieldHint,
      required this.controller,
      required this.fieldUnit,
      required this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes().spaceBetweenItems(context)),
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width * 0.91,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: Color(AppColors().itemShadow),
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.885,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(AppColors().itemBack),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppSizes().paddingWidthPoint2(context)),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  margin: EdgeInsets.only(
                                      left: AppSizes()
                                          .paddingWidthPoint3(context),
                                      right: AppSizes()
                                          .paddingWidthPoint2(context)),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        color:
                                            Color(AppColors().titleTextColor),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: 'Inter_regular'),
                                    child: Text(
                                      "610 AED",
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
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
