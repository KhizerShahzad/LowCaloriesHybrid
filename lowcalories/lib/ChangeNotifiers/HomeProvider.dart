import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/Models/ListModel.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Views/Home/SubViews/HomeDashboardWidget.dart';
import 'package:lowcalories/Views/Home/SubViews/TrackMealProgress.dart';

class HomeNotifier with ChangeNotifier {
  var currentScreen = "Home";
  var currentScreenTitle = "Home";
  List<ListItem> stage4Items = [
    ListItem("Assets/ic_sample_food_home.png", "Custom Plan", listSubTitle: ""),
  ];

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

  Widget returnSelectedScreen(BuildContext context) {
    if (currentScreen == "Home") {
      return HomeDashboardWidget();
    } else if (currentScreen == "Track Plan Progress") {}
    return MealPlanProgress();
  }

  updateCurrentScreen(String screenId) {
    currentScreen = screenId;
    if (screenId == "Track Plan Progress") {
      currentScreenTitle = "Meal Plan Progress";
    }
    notifyListeners();
  }
}
