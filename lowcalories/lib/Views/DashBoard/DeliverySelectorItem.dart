import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';

class DeliverySelectorItem extends StatelessWidget {
  DeliverySelectorItem({super.key, required this.itemIndex, required this.notifier});

  var itemIndex = 0;
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateDeliveryDaysSelection(itemIndex);
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: AppSizes().spaceBetweenItemsHorizontal(context)),
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.29,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(topRight: Radius.circular(35),bottomRight:  Radius.circular(35),topLeft: Radius.circular(7),bottomLeft:  Radius.circular(7)  ),
              color: Color(AppColors().black4transparent),
              border: Border.all(
                width: 2,
                color: notifier.deliveryDaysList[itemIndex].isSelected
                    ? Color(AppColors().newGreen)
                    : Color(AppColors().itemShadow),
                style: BorderStyle.solid,
              )
          ),
          child: Center(
            child: DefaultTextStyle(
              style: AppStyles().fontInter400(15,Color(AppColors().deppDark)),
              child: Text(notifier.deliveryDaysList[itemIndex].listTitle),
            ),
          ),
        ),
      ) ,
    );
  }
}
