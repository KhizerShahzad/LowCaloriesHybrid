import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:provider/provider.dart';

class GoalSelection extends StatefulWidget {
  const GoalSelection({super.key});

  @override
  State<GoalSelection> createState() => _GoalSelectionState();
}

class _GoalSelectionState extends State<GoalSelection>
    implements AppBarClickInterface {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            color: Colors.white,
            child: PopScope(
              canPop: false,
              onPopInvoked: (isPoped) {
                value.updateStage(isForward: false, mContext: context);
              },
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                  child: Column(
                    children: [
                      AppBarWithArrow(
                          appBarText: value.stageText,
                          appBarClickInterface: this,
                          screenName: "",
                          notifier: value),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ScreenStep(
                              isDone: value.stage1Complete,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            ScreenStep(
                              isDone: value.stage2Complete,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            ScreenStep(
                              isDone: value.stage3Complete,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            ScreenStep(isDone: value.stage4Complete),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: AppSizes().GoalSelectionTop(context)),
                            child: value.returnSelectedScreen(),
                          )),
                      InkWell(
                        onTap: () {
                          value.updateStage(isForward: true, mContext: context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.03),
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * .024,
                                  bottom:
                                      MediaQuery.of(context).size.height * .024,
                                  right:
                                      MediaQuery.of(context).size.width * .134,
                                  left:
                                      MediaQuery.of(context).size.width * .134),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(AppColors().newGreen),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(225, 222, 226, 230),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontFamily: 'Roboto'),
                                child: Text("NEXT"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {
    value?.updateStage(isForward: false, mContext: context);
  }

  @override
  onBackClickWithoutNotifier(BuildContext context, String type) {}
}

class ScreenStep extends StatelessWidget {
  ScreenStep({super.key, required this.isDone});

  var isDone = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(width: 5.0, color: Colors.white),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.01,
              width: MediaQuery.of(context).size.width * 0.20,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(isDone
                        ? AppColors().newGreen
                        : AppColors().deppDark10Opacity),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
