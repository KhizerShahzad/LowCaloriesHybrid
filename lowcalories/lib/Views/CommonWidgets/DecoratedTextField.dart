import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';

class DecoratedTextField extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";
  String fieldUnit = "";
  TextEditingController controller;

  DecoratedTextField(
      this.fieldHint, this.fieldText, this.controller, this.fieldUnit);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppSizes().paddingWidthPoint2(context)),
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Color(AppColors().titleTextColor)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: fieldHint,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(AppColors().titleTextColor)),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final text = newValue.text;
                      return text.isEmpty
                          ? newValue
                          : double.tryParse(text) == null
                              ? oldValue
                              : newValue;
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(right: AppSizes().paddingWidthPoint3(context)),
          child: Text(
            fieldUnit,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Inter',
                color: Color(AppColors().titleTextColor)),
          ),
        )
      ],
    );
  }
}
