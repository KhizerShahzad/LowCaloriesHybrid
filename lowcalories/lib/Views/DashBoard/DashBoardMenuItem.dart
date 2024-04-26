import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppStyles.dart';

class DashboarMenuItem extends StatelessWidget {
  DashboarMenuItem(
      {super.key, required this.itemIndex, required this.notifier});

  var itemIndex = 0;
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateDashboardMealSelection(itemIndex);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.4,
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: notifier.mealTypeList[itemIndex].isSelected
                ? Color(AppColors().newGreen)
                : Color(AppColors().itemShadow),
            style: BorderStyle.solid,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("Assets/dinner_background_menu.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/dinner_background_menu.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: DefaultTextStyle(
                  style: AppStyles().fontInterItalic(14),
                  child: Text(notifier.mealTypeList[itemIndex].listTitle),
                ),
              ),
            ),
          ),
        ) /* add child content here */,
      ),
    );
  }
}
