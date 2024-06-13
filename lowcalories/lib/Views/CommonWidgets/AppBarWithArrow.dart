import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';

class AppBarWithArrow extends StatelessWidget {
  AppBarWithArrow(
      {super.key,
      required this.appBarText,
      required this.appBarClickInterface,
      required this.screenName,
      required this.notifier});

  String appBarText;
  String screenName;
  AppBarClickInterface appBarClickInterface;
  GoalSelectionScreenNotifier notifier = GoalSelectionScreenNotifier();
  MapChangeNotifier mapChangenNotifier = MapChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (appBarText == "Delivery Address" ||
                      screenName == "Log in" ||
                      screenName == "meal_plan" ||
                      screenName == "sign_up") {
                    appBarClickInterface.onBackClickWithoutNotifier(
                        context, appBarText);
                  } else {
                    appBarClickInterface.onBackClick(context, appBarText,
                        value: notifier);
                  }
                },
                child: Image.asset(
                  fit: BoxFit.fitHeight,
                  'Assets/customBackGrey.png',
                  height: 55,
                  width: 55,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: DefaultTextStyle(
                  style: TextStyle(
                      color: Color(AppColors().deppDark),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontFamily: 'Inter'),
                  child: Text(
                    appBarText,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
