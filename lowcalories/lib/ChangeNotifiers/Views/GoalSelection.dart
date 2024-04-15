import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:provider/provider.dart';

class GoalSelection extends StatefulWidget {
  const GoalSelection({super.key});

  @override
  State<GoalSelection> createState() => _GoalSelectionState();
}

class _GoalSelectionState extends State<GoalSelection> {
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
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              value.updateStage(
                                  isForward: false, mContext: context);
                            },
                            child: Image.asset(
                              fit: BoxFit.fitHeight,
                              'Assets/customBack.jpg',
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
                                value.stageText,
                              ),
                            ),
                          )
                        ],
                      ),
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
                      Expanded(flex: 1, child: value.returnSelectedScreen()),
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
}

class ScreenStep extends StatelessWidget {
  ScreenStep({super.key, required this.isDone});

  var isDone = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 5.0, color: Colors.white),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.width * 0.19,
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
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              20
          ),
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

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            )),
      ),
    );
  }
}

class GoalStep3ItemCustom extends StatelessWidget {
  GoalStep3ItemCustom({super.key, required this.index, required this.notifier});

  var index = 0;

  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateStage3Items(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(
              20
          ),
          border: Border.all(
            width: 1,
            color: notifier.stage3Items[index].isSelected
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
                              notifier.stage3Items[index].imagePath)),
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

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: Color(AppColors().titleTextColor)),
                          child: Text(
                            notifier.stage3Items[index].listTitle,
                          ),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: Color(AppColors().titleTextColor)),
                          child: Text(
                            notifier.stage3Items[index].listSubTitle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class GoalStep4ItemCustom extends StatelessWidget {
  GoalStep4ItemCustom({super.key, required this.index, required this.notifier});

  var index = 0;

  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateStage4Items(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
          20
          ),
          border: Border.all(
            width: 1,
            color: notifier.stage4Items[index].isSelected
                ? Colors.green
                : Color(AppColors().itemShadow),
            style: BorderStyle.solid,
          ),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.09,
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
                              notifier.stage4Items[index].imagePath)),
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

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: Color(AppColors().titleTextColor)),
                          child: Text(
                            notifier.stage4Items[index].listTitle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

/*class GoalStep3Item extends StatelessWidget {
  GoalStep3Item({super.key, required this.index, required this.notifier});

  var index = 0;

  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateStage3Items(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: notifier.stage3Items[index].isSelected
                    ? AssetImage("Assets/ic_selected_back.jpg")
                    : AssetImage("Assets/ic_group_back.png"),
                fit: BoxFit.cover,
              )),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(22),
                  margin: EdgeInsets.only(left: 0),
                  child:
                      SvgPicture.asset(notifier.stage3Items[index].imagePath)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: Color(AppColors().titleTextColor)),
                      child: Text(
                        notifier.stage3Items[index].listTitle,
                      ),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: Color(AppColors().titleTextColor)),
                      child: Text(
                        notifier.stage3Items[index].listSubTitle,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
