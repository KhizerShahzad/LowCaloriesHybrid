import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lowcalories/Models/CalorieItem.dart';
import 'package:lowcalories/Models/MealItem.dart';
import 'package:lowcalories/Views/DashBoard/DashBoard.dart';
import 'package:lowcalories/Views/SignInSelectionScreen.dart';
import 'package:lowcalories/Views/GoalSelection/Step1Screen.dart';
import 'package:lowcalories/Views/GoalSelection/Step1Screen.dart';
import 'package:lowcalories/Views/GoalSelection/Step3Screen.dart';
import 'package:lowcalories/Views/GoalSelection/Step4Screen.dart';

import 'package:lowcalories/Models/UserProfile.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppStrings.dart';
import 'package:lowcalories/Models/ListModel.dart';

import '../Views/GoalSelection/Step2Screen.dart';

class GoalSelectionScreenNotifier with ChangeNotifier {
  var stageText = AppStrings().goalScreen1Text;
  var stageLevel = 0;
  var stage1Complete = false;
  var stage2Complete = false;
  var stage3Complete = false;
  var stage4Complete = false;
  var stage1Selection = "";
  UserProfile userProfile = UserProfile();
  List<ListItem> stage1Items = [
    ListItem("Assets/dinner.svg", "Lose Weight"),
    ListItem("Assets/weightgain.svg", "Gain Weight"),
    ListItem("Assets/maintainweight.svg", "Maintain Weight")
  ];
  List<ListItem> mealTypeList = [
    ListItem("", "Full\nDay"),
    ListItem("", "BreakFast\n+ Lunch"),
    ListItem("", "Lunch +\nDinner"),
    ListItem("", "BreakFast +\nDinner"),
  ];
  TextEditingController weightController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAdressController = TextEditingController();
  List<ListItem> stage4Items = [
    ListItem("Assets/ic_fish.svg", "Fish"),
    ListItem("Assets/ic_meat.svg", "Meat"),
    ListItem("Assets/ic_chicken.svg", "Chicken"),
    ListItem("Assets/ic_dairy.svg", "Dairy"),
    ListItem("Assets/ic_eggs.svg", "Eggs"),
    ListItem("Assets/ic_nuts.svg", "Nuts"),
    ListItem("Assets/ic_spices.svg", "Spices"),
  ];

  List<ListItem> caloriesList = [
    ListItem("", "1100-1300"),
    ListItem("", "1300-1500"),
    ListItem("", "1500-1600"),
    ListItem("", "1600-1800"),
    ListItem("", "1800-2000"),
    ListItem("", "2000-2200"),
  ];
  List<CalorieBreakdownItem> calorieBreakdownItem = [
    CalorieBreakdownItem("Proteins", "35-55g"),
    CalorieBreakdownItem("Carbs", "65-70g"),
    CalorieBreakdownItem("Fats", "12-46g")
  ];
  List<ListItem> deliveryDaysList = [
    ListItem("", "7"),
    ListItem("", "5"),
    ListItem("", "10"),
    ListItem("", "20"),
    ListItem("", "30"),
    ListItem("", "40"),
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
  List<MealItem> mealDummyItems = [
    MealItem("Assets/shrimpSandwich.png","Breakfast","Shrimp Sandwich","20",
        "30","50","60"),
    MealItem("Assets/shrimpSandwich.png","AfterNoon","Beetroot Salad","20",
        "30","50","60"),
    MealItem("Assets/shrimpSandwich.png","Lunch","Fettucine Pasta","20",
        "30","50","60"),
    MealItem("Assets/shrimpSandwich.png","Dinner","Biryani","20",
        "30","50","60")
  ];

  updateStage1Items(int index) {
    for (var item in stage1Items) {
      item.isSelected = false;
    }
    stage1Items[index].isSelected = true;
    stage1Complete = true;
    notifyListeners();
  }

  updateDashboardMealSelection(int index) {
    for (var item in mealTypeList) {
      item.isSelected = false;
    }
    mealTypeList[index].isSelected = true;
    notifyListeners();
  }

  updateCalorieRangeSelection(int index) {
    for (var item in caloriesList) {
      item.isSelected = false;
    }
    caloriesList[index].isSelected = true;
    notifyListeners();
  }

  updateDeliveryDaysSelection(int index) {
    for (var item in deliveryDaysList) {
      item.isSelected = false;
    }
    deliveryDaysList[index].isSelected = true;
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
    stage4Items[index].isSelected = true;
    stage4Complete = true;
    notifyListeners();
  }

  updateGender(String gender) {
    userProfile.gender = gender;
    notifyListeners();
  }

  setHeight(String height) {
    userProfile.height = height;
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
        } else {
          showNoItemSelected(mContext);
        }
      } else if (stageLevel == 1) {
        if (userProfile.gender.isNotEmpty &&
            userProfile.dateOfBirth.isNotEmpty &&
            weightController.text.toString().isNotEmpty &&
            heightController.text.toString().isNotEmpty &&
            targetWeightController.text.toString().isNotEmpty) {
          userProfile.weight = weightController.text.toString();
          userProfile.height = heightController.text.toString();
          userProfile.targetWeight = targetWeightController.text.toString();
          stage2Complete = true;
          moveForward(currentStageText: AppStrings().goalScreen3Text);
        } else {
          if (userProfile.gender.isEmpty) {
            showPrompt(mContext, 'Select Gender');
          } else if (userProfile.dateOfBirth.isEmpty) {
            showPrompt(mContext, 'Select Date of Birth');
          } else if (weightController.text.toString().isEmpty) {
            showPrompt(mContext, 'Enter Weight');
          } else if (heightController.text.toString().isEmpty) {
            showPrompt(mContext, 'Enter Height');
          } else if (targetWeightController.text.toString().isEmpty) {
            showPrompt(mContext, 'Enter Target Height');
          }
          stage2Complete = false;
        }
      } else if (stageLevel == 2) {
        if (stage3Complete) {
          moveForward(currentStageText: AppStrings().goalScreen4Text);
        } else {
          showNoItemSelected(mContext);
        }
      } else if (stageLevel == 3) {
        if (stage4Complete) {
          Navigator.push(
            mContext,
            MaterialPageRoute(builder: (context) => DashBoard()),
          );
        }
      }
    } else {
      if (stageLevel == 0) {
        showDialog(
            context: mContext,
            builder: (mContext) {
              return AlertDialog(
                buttonPadding: EdgeInsets.only(bottom: 0),
                contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(mContext).size.height * 0.005,
                    horizontal: MediaQuery.of(mContext).size.width * 0.03),
                title: Text(
                  'Info',
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(
                        AppColors().popUpHeaderColor,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
                content: Container(
                  height: MediaQuery.of(mContext).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(mContext).size.width * 0.02),
                        child: Text(
                            'Are you sure you want to move back?\nYour Progress will be lost!',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(
                                  AppColors().popUpBodyTextColor,
                                ),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
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
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(
                            AppColors().newGreen,
                          ),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(mContext);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(
                            AppColors().titleTextColor,
                          ),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
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

  showPrompt(BuildContext mContext, String message) {
    showDialog(
        context: mContext,
        builder: (mContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(mContext).size.height * 0.013,
                horizontal: MediaQuery.of(mContext).size.width * 0.03),
            title: Text(
              'Info',
              style: TextStyle(
                  fontSize: 23,
                  color: Color(
                    AppColors().popUpHeaderColor,
                  ),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(mContext).size.width * 0.023),
                  child: Text(message,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            AppColors().popUpBodyTextColor,
                          ),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(mContext);
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(
                        AppColors().titleTextColor,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(mContext);
                },
                child: Text(
                  'Okay',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(
                        AppColors().newGreen,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        });
  }

  showNoItemSelected(BuildContext mContext) {
    showDialog(
        context: mContext,
        builder: (mContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(mContext).size.height * 0.013,
                horizontal: MediaQuery.of(mContext).size.width * 0.03),
            title: Text(
              'Info',
              style: TextStyle(
                  fontSize: 23,
                  color: Color(
                    AppColors().popUpHeaderColor,
                  ),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(mContext).size.width * 0.02),
                  child: Text('Please Select One!',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            AppColors().popUpBodyTextColor,
                          ),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(mContext);
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(
                        AppColors().titleTextColor,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(mContext);
                },
                child: Text(
                  'Okay',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(
                        AppColors().newGreen,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        });
  }

  moveForward({required String currentStageText}) {
    if (stageLevel < 4) {
      stageLevel = stageLevel + 1;
      stageText = currentStageText;
      notifyListeners();
    }
  }

  updateDate({required String date}) {
    userProfile.dateOfBirth = date;
    notifyListeners();
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
    stage2Complete = false;
    userProfile = UserProfile();
    weightController.text = "";
    heightController.text = "";
    targetWeightController.text = "";
  }

  Widget returnSelectedScreen() {
    if (stageLevel == 0) {
      return GoalStage1List(
        items: stage1Items,
        notifier: this,
      );
    } else if (stageLevel == 1) {
      return GoalStage2Stateful(notifier: this);
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
