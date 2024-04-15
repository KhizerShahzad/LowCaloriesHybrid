import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lowcalories/ChangeNotifiers/Views/GoalSelection.dart';
import 'package:lowcalories/ChangeNotifiers/Views/SignInSelectionScreen.dart';
import 'package:lowcalories/Utills/AppStrings.dart';
import 'package:lowcalories/Models/ListModel.dart';

class GoalSelectionScreenNotifier with ChangeNotifier {
  var stageText = AppStrings().goalScreen1Text;
  var stageLevel = 0;
  var stage1Complete = false;
  var stage2Complete = true;
  var stage3Complete = false;
  var stage4Complete = false;
  var stage1Selection = "";

  List<ListItem> stage1Items = [
    ListItem("Assets/dinner.svg", "Lose Weight"),
    ListItem("Assets/weightgain.svg", "Gain Weight"),
    ListItem("Assets/maintainweight.svg", "Maintain Weight")
  ];
  List<ListItem> stage4Items = [
    ListItem("Assets/ic_fish.svg", "Fish"),
    ListItem("Assets/ic_meat.svg", "Meat"),
    ListItem("Assets/ic_chicken.svg", "Chicken"),
    ListItem("Assets/ic_dairy.svg", "Dairy"),
    ListItem("Assets/ic_eggs.svg", "Eggs"),
    ListItem("Assets/ic_nuts.svg", "Nuts"),
    ListItem("Assets/ic_spices.svg", "Spices"),
  ];
  List<ListItem> stage3Items = [
    ListItem("Assets/ic_not_active.svg", "Not active at all",
        listSubTitle: "Spend most of the time sitting"),
    ListItem("Assets/ic_somewhat_active.svg", "Somewhat active",
        listSubTitle: "Exercise 1-2 times/week"),
    ListItem("Assets/ic_moderate.svg", "Moderate",
        listSubTitle: "Exercise 3-4 times/week"),
    ListItem("Assets/ic_fully_active.svg", "Fully Active",
        listSubTitle: "Exercise 5-6 times/week"),
    ListItem("Assets/ic_athlete.svg", "I am an Athlete",
        listSubTitle: "Exercise 6-7 times/week")
  ];

  updateStage1Items(int index) {
    for (var item in stage1Items) {
      item.isSelected = false;
    }
    stage1Items[index].isSelected = true;
    stage1Complete = true;
    notifyListeners();
  }

  updateStage3Items(int index) {
    for (var item in stage3Items) {
      item.isSelected = false;
    }
    stage3Items[index].isSelected = true;
    stage3Complete = true;
    notifyListeners();
  }

  updateStage4Items(int index) {
    for (var item in stage4Items) {
      item.isSelected = false;
    }
    stage4Items[index].isSelected = true;
    stage4Complete = true;
    notifyListeners();
  }

  updateStage({
    required bool isForward,
    required BuildContext mContext,
  }) {
    if (isForward == true) {
      if (stageLevel == 0) {
        if (stage1Complete) {
          moveForward(currentStageText: AppStrings().goalScreen2Text);
        }
      } else if (stageLevel == 1) {
        if (stage2Complete) {
          moveForward(currentStageText: AppStrings().goalScreen3Text);
        }
      } else if (stageLevel == 2) {
        if (stage3Complete) {
          moveForward(currentStageText: AppStrings().goalScreen4Text);
        }
      } else if (stageLevel == 3) {
        if (stage4Complete) {}
      }
    } else {
      if (stageLevel == 0) {
        showDialog(
            context: mContext,
            builder: (mContext) {
              return AlertDialog(
                title: const Text('ALERT'),
                content: const Text('Are you sure you want to move back?\nYour Progress will be lost!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      clearAllSelection();
                      Navigator.push(
                        mContext,
                        MaterialPageRoute(
                            builder: (context) => SignInSelectionScreen()),
                      );
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(mContext);
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            });
      } else if (stageLevel == 1) {
        moveBackword(currentStageText: AppStrings().goalScreen1Text);
      } else if (stageLevel == 2) {
        moveBackword(currentStageText: AppStrings().goalScreen2Text);
      } else if (stageLevel == 3) {
        moveBackword(currentStageText: AppStrings().goalScreen3Text);
      }
    }
  }

  moveForward({required String currentStageText}) {
    if (stageLevel < 4) {
      stageLevel = stageLevel + 1;
      stageText = currentStageText;
      notifyListeners();
    }
  }

  moveBackword({required String currentStageText}) {
    if (stageLevel > 0) {
      stageLevel = stageLevel - 1;
      stageText = currentStageText;
      notifyListeners();
    } else {}
  }

  clearAllSelection() {
    for (var item in stage1Items) {
      item.isSelected = false;
    }
    for (var item in stage3Items) {
      item.isSelected = false;
    }
    for (var item in stage4Items) {
      item.isSelected = false;
    }
    stage4Complete = false;
    stage3Complete = false;
    stage1Complete = false;
  }

  Widget returnSelectedScreen() {
    if (stageLevel == 0) {
      return GoalStage1List(
        items: stage1Items,
        notifier: this,
      );
    } else if (stageLevel == 1) {
      return Container();
    } else if (stageLevel == 2) {
      return GoalStage3List(
        items: stage3Items,
        notifier: this,
      );
    } else if (stageLevel == 3) {
      return GoalStage4List(
        items: stage4Items,
        notifier: this,
      );
    }
    return Container();
  }
}

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

class GoalStage3List extends StatelessWidget {
  GoalStage3List({super.key, required this.items, required this.notifier});

  final List<ListItem> items;
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GoalStep3ItemCustom(
          index: index,
          notifier: notifier,
        );
      },
    );
  }
}

class GoalStage4List extends StatelessWidget {
  GoalStage4List({super.key, required this.items, required this.notifier});

  final List<ListItem> items;
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GoalStep4ItemCustom(
          index: index,
          notifier: notifier,
        );
      },
    );
  }
}
