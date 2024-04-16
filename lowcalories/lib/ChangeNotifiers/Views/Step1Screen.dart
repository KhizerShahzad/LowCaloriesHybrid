import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Models/ListModel.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/Constants.dart';
class GoalStage1List extends StatelessWidget {
  GoalStage1List({super.key, required this.items, required this.notifier});

  final List<ListItem> items;
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GoalStep1ItemCustom(
            index: index,
            notifier: notifier,
          );
        },
      ),
    );
  }
}
class GoalStep1ItemCustom extends StatelessWidget {
  GoalStep1ItemCustom({super.key, required this.index, required this.notifier});

  var index = 0;

  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateStage1Items(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: Constants().spaceBetweenItems(context)),
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: notifier.stage1Items[index].isSelected
                ? Colors.green
                : Color(AppColors().itemShadow),
            style: BorderStyle.solid,
          ),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(left: 0),
                          child: SvgPicture.asset(
                              notifier.stage1Items[index].imagePath)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Color(AppColors().itemBack),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: Constants().paddingFrontPoint3(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultTextStyle(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                color: Color(AppColors().titleTextColor)),
                            child: Text(
                              notifier.stage1Items[index].listTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}