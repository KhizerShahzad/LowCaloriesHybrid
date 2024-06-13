import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget implements AppBarClickInterface {
  OrderSummary({super.key, required this.goalSelectionScreenNotifier});

  late GoalSelectionScreenNotifier goalSelectionScreenNotifier;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<MapChangeNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: AppBarWithArrow(
                          appBarText: "Order Summary",
                          appBarClickInterface: this,
                          screenName: "",
                          notifier: GoalSelectionScreenNotifier()),
                    ),
                    Column(
                      children: [

                      ],
                    )
                  ],
                ),
              ),
            ),
          );
          ;
        },
      ),
    );
    ;
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {}

  @override
  onBackClickWithoutNotifier(BuildContext context, String type) {
    Navigator.pop(context);
  }
}
