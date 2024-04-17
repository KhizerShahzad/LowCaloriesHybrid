import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/Constants.dart';
class GoalStage2Stateful extends StatefulWidget {
   GoalStage2Stateful({super.key,required this.notifier});
  GoalSelectionScreenNotifier notifier;
  @override
  State<GoalStage2Stateful> createState() => _GoalStage2StatefulState(notifier: notifier);
}

class _GoalStage2StatefulState extends State<GoalStage2Stateful> {
  _GoalStage2StatefulState({ required this.notifier});

  GoalSelectionScreenNotifier notifier;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                    imagePath: "Assets/dob.svg"),
                GoalInputText(
                  notifier: notifier,
                  imagePath: "Assets/weightloss.svg",
                  fieldHint: "Weight",
                  fieldText: notifier.userProfile.weight.isEmpty ?"":notifier.userProfile.weight,
                  controller: notifier.weightController,
                  fieldUnit: "KG",
                ),
                GoalInputText(
                  notifier: notifier,
                  imagePath: "Assets/length.svg",
                  fieldHint: "Height",
                  fieldText: notifier.userProfile.height.isEmpty ?"":notifier.userProfile.height,
                  controller:  notifier.heightController,
                  fieldUnit: "CM",
                ),
                GoalInputText(
                  notifier: notifier,
                  imagePath: "Assets/weightgain.svg",
                  fieldHint: "Target Weight",

                  fieldText: notifier.userProfile.targetWeight.isEmpty ?"":notifier.userProfile.targetWeight,
                  controller:  notifier.targetWeightController,
                  fieldUnit: "KG",
                ),
              ],
            ),
          ),
          /*  GoalInputText(
            notifier: notifier,
            imagePath: "Assets/weightloss.svg",fieldText: "",fieldHint: "Weight",controller: weightController)*/
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
                          padding: EdgeInsets.only(
                              left: Constants().paddingFrontPoint3(context)),
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
        handleClick(lableText, context, notifier);
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Constants().paddingFrontPoint3(context)),
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                color: Color(AppColors().titleTextColor)),
                            child: Text(
                              notifier.userProfile.dateOfBirth.isNotEmpty
                                  ? notifier.userProfile.dateOfBirth
                                  : lableText,
                            ),
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

class GoalInputText extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";

  var imagePath = "";
  GoalSelectionScreenNotifier notifier;
  TextEditingController controller;
  String fieldUnit = "";
  GoalInputText(
      {super.key,
      required this.notifier,
      required this.imagePath,
      required this.fieldText,
      required this.fieldHint,
      required this.controller,required this.fieldUnit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Constants().spaceBetweenItems(context)),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Constants().paddingFrontPoint2(context)),
                        child:
                            DecoratedTextField(fieldHint, "", controller,fieldUnit),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class DecoratedTextField extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";
  String fieldUnit = "";
  TextEditingController controller;

  DecoratedTextField(this.fieldHint, this.fieldText, this.controller,this.fieldUnit);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: controller,
                style:TextStyle(
                    color: Color(AppColors().deppDark),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'Inter')  ,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: fieldHint,
                    hintStyle: TextStyle(
                        color: Color(AppColors().deppDark),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'Inter'), ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text;
                    return text.isEmpty
                        ? newValue
                        : double.tryParse(text) == null
                        ? oldValue
                        : newValue;
                  }),
                ],
              ),
            ),

          ],
        ), Text(fieldUnit,style: TextStyle(
            color: Color(AppColors().deppDark),
            fontWeight: FontWeight.w700,
            fontSize: 16,
            fontFamily: 'Inter'),)
      ],
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

handleClick(
    String type, BuildContext mContext, GoalSelectionScreenNotifier notifier) {
  if (type == "DOB") {
    showDatePicker(
      context: mContext,
      firstDate: DateTime(1980),
      lastDate: DateTime.fromMillisecondsSinceEpoch(1638592424384),
      initialDate: DateTime.fromMillisecondsSinceEpoch(1638592424384),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((value) => {
          if (value != null)
            {
              notifier.updateDate(
                  date: value.day.toString() +
                      "/" +
                      value.month.toString() +
                      "/" +
                      value.year.toString())
            }
        });
  }
}
