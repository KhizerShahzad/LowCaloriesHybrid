import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/Constants.dart';

class GoalStage2Screen extends StatelessWidget {
  GoalStage2Screen({super.key, required this.notifier});

  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
      child: Column(
        children: [
          TextStart(
            lableText: "Gender",
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 5),
                  child: GenderSelectionWidget(
                      notifier: notifier,
                      gender: "Male",
                      leadingIcon: "Assets/male_gender.svg")),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: GenderSelectionWidget(
                    notifier: notifier,
                    gender: "Female",
                    leadingIcon: "Assets/female_gender.svg",
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.012),
            child: Column(
              children: [
                TextStart(
                  lableText: "Physical Detail",
                ),
                DateOfBirth(
                    notifier: notifier,
                    lableText: "DOB",
                    imagePath: "Assets/dob.svg")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class GenderSelectionWidget extends StatelessWidget {
  GenderSelectionWidget(
      {super.key,
        required this.notifier,
        required this.gender,
        required this.leadingIcon});

  var gender = "";
  var leadingIcon = "";
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.updateGender(gender);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: notifier.userProfile.gender == gender
                ? Colors.green
                : Color(AppColors().itemShadow),
            style: BorderStyle.solid,
          ),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,
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
                          child: SvgPicture.asset(leadingIcon)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: Constants().paddingFrontPoint3(context)),
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                color: Color(AppColors().titleTextColor)),
                            child: Text(gender),
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
class DateOfBirth extends StatelessWidget {
  DateOfBirth({
    super.key,
    required this.notifier,
    required this.lableText,
    required this.imagePath,
  });

  var lableText = "";
  var imagePath = "";
  GoalSelectionScreenNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        handleClick(lableText);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Color(AppColors().itemShadow),
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
                        child: SvgPicture.asset(imagePath),
                      )
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
                            "",
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
class TextStart extends StatelessWidget {
  TextStart({super.key, required this.lableText});

  var lableText = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: TextStyle(
              color: Color(AppColors().deppDark),
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontFamily: 'Inter'),
          child: Text(lableText),
        ),
      ],
    );
  }
}
handleClick(String type) {
  if (type == "DOB") {}
}
