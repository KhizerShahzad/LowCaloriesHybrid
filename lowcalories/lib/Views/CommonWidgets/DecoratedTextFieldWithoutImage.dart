import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';

class InputTextFieldDecoratedWithoutImage extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";
  GoalSelectionScreenNotifier notifier;
  TextEditingController controller;
  String fieldUnit = "";
  bool isPasswordField = false;

  InputTextFieldDecoratedWithoutImage(
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
      height: MediaQuery.of(context).size.height * 0.085,
      width: MediaQuery.of(context).size.width,
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
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(AppColors().itemBack),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: AppSizes()
                                            .paddingWidthPoint3(context),
                                        right: AppSizes()
                                            .paddingWidthPoint2(context)),
                                    child: TextField(
                                      controller: controller,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          color: Color(
                                              AppColors().titleTextColor)),
                                      obscureText: isPasswordField,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: fieldHint,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            color: Color(
                                                AppColors().titleTextColor)),
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ),
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
