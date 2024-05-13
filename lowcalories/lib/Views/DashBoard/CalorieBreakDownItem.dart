import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';

class CalorieBreakDownListItem extends StatelessWidget {
  CalorieBreakDownListItem(
      {super.key, required this.itemIndex, required this.notifier});

  var itemIndex = 0;
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateCalorieRangeSelection(itemIndex);
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(right: AppSizes().spaceBetweenItems(context)),
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.30,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0)),
                    color: Color(AppColors().transparentLightGreen),
                  ),
                  height: AppSizes().paddingWidthPoint3(context),
                  child: Center(
                    child: DefaultTextStyle(
                      style: AppStyles()
                          .fontInter400(15, Color(AppColors().deppDark)),
                      child:
                          Text(notifier.calorieBreakdownItem[itemIndex].weight),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    color: Color(AppColors().newGreen),
                  ),
                  height: AppSizes().paddingWidthPoint3(context),
                ),
              ),
              Container(
                child: Center(
                  child: DefaultTextStyle(
                    style: AppStyles()
                        .fontInterBoldColor(15, Color(AppColors().deppDark)),
                    child:
                        Text(notifier.calorieBreakdownItem[itemIndex].itemName),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
