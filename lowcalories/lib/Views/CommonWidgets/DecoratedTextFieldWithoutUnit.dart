import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:provider/provider.dart';

class DecoratedTextFieldWithoutFieldUnit extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";
  TextEditingController controller;
  MapChangeNotifier notifier;

  DecoratedTextFieldWithoutFieldUnit(
      this.fieldHint, this.fieldText, this.controller, this.notifier);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppSizes().paddingWidthPoint2(context)),
                child: TextField(
                  onChanged: (text) {
                    notifier.getSuggestion(text, context);
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: fieldHint,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        color: Color(AppColors().titleTextColor)),
                  ),
                  keyboardType: TextInputType.streetAddress,
                  /*      inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final text = newValue.text;
                      return text.isEmpty
                          ? newValue
                          : double.tryParse(text) == null
                          ? oldValue
                          : newValue;
                    }),
                  ],*/
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
