import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';

import 'package:lowcalories/Utills/Interfaces/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Utills/CheckOutClickInterface.dart';
import 'package:lowcalories/Utills/Interfaces/DialogClickInterface.dart';
import 'package:lowcalories/Utills/UtillMethods.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:lowcalories/Views/CommonWidgets/TextFieldDecoratedWithoutImage.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget
    implements AppBarClickInterface, CheckOutButtonListner,DialogClickInterface {
  OrderSummary({super.key, required this.goalSelectionScreenNotifier});

  late GoalSelectionScreenNotifier goalSelectionScreenNotifier;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: [
                            AppBarWithArrow(
                                appBarText: "Order Summary",
                                appBarClickInterface: this,
                                screenName: "",
                                notifier: GoalSelectionScreenNotifier()),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  top: AppSizes()
                                      .SectionSeprationSpace(context)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(
                                            color: Color(
                                                AppColors().titleTextColor),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            fontFamily: 'Inter_medium'),
                                        child: Text(
                                          "Order Details",
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSizes()
                                            .SectionSeprationSpace(context)),
                                    child: InformationShowWidget(
                                      header: "Location",
                                      value: "Dubai Mall Shop #A453",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSizes()
                                            .SectionSeprationSpace(context)),
                                    child: InformationShowWidget(
                                      header: "Weight Loss Plan",
                                      value:
                                          "Full Day x 7 days, 1100 - 1300 Cal",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSizes()
                                            .SectionSeprationSpace(context)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DefaultTextStyle(
                                              style: TextStyle(
                                                  color: Color(AppColors()
                                                      .titleTextColor),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  fontFamily: 'Inter_medium'),
                                              child: Text(
                                                "Payment",
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.005),
                                              child: DefaultTextStyle(
                                                style: TextStyle(
                                                    color: Color(AppColors()
                                                        .titleTextColor),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    fontFamily: 'Inter_medium'),
                                                child: Text(
                                                  "Cash",
                                                ),
                                              ),
                                            ),
                                            TextFieldDecoratedWithoutImage(
                                              notifier: value,
                                              fieldHint: "First Name",
                                              fieldText: value.userProfile
                                                      .firstName.isEmpty
                                                  ? ""
                                                  : value.userProfile.firstName,
                                              controller:
                                                  value.firstNameController,
                                              fieldUnit: "",
                                              isPasswordField: false,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    DefaultTextStyle(
                                                      style: TextStyle(
                                                          color: Color(
                                                              AppColors()
                                                                  .newGreen),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'Inter_medium'),
                                                      child: Text(
                                                        "Add Card",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.03),
                            decoration: BoxDecoration(
                              color: Color(AppColors().lightGrey),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.04,
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.053),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DefaultTextStyle(
                                              style: AppStyles()
                                                  .fontRobotoWeight300(
                                                      14, Colors.black),
                                              child: const Text(
                                                'Meal plan price',
                                              ),
                                            ),
                                            DefaultTextStyle(
                                              style: AppStyles()
                                                  .fontRobotoWeight300(
                                                      15,
                                                      Color(AppColors()
                                                          .titleTextColor)),
                                              child: Text(
                                                'AED 600',
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.004,
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.053),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DefaultTextStyle(
                                              style: AppStyles()
                                                  .fontRobotoWeight300(
                                                      14, Colors.black),
                                              child: const Text(
                                                'VAT',
                                              ),
                                            ),
                                            DefaultTextStyle(
                                              style: AppStyles()
                                                  .fontRobotoWeight300(
                                                      15,
                                                      Color(AppColors()
                                                          .titleTextColor)),
                                              child: Text(
                                                'AED 600',
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.004,
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.053),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DefaultTextStyle(
                                              style: AppStyles()
                                                  .fontRobotoWeightBold(
                                                      18,
                                                      Color(AppColors()
                                                          .titleTextColor)),
                                              child: const Text(
                                                'Subtotal',
                                              ),
                                            ),
                                            DefaultTextStyle(
                                              style: AppStyles()
                                                  .fontRobotoWeightBold(
                                                      18,
                                                      Color(AppColors()
                                                          .titleTextColor)),
                                              child: Text(
                                                'AED 610',
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: InkWell(
                                    onTap: () {
                                      this.onCheckoutClick(context, "");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color:
                                                  Color(AppColors().newGreen),
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                    225, 222, 226, 230),
                                                width: 2,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Center(
                                              child: DefaultTextStyle(
                                                style: AppStyles()
                                                    .fontInter500Color(
                                                        16, Colors.white),
                                                child: Text("Checkout"),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
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
      {GoalSelectionScreenNotifier? value}) {
    Navigator.pop(context);
  }

  @override
  onBackClickWithoutNotifier(BuildContext context, String type) {
    Navigator.pop(context);
  }

  @override
  onCheckoutClick(BuildContext context, String type) {
    UtillMethods().showPrompt(
        context, "You have now purchased your desired\nweight loss plan", this,
        header: "Congratulations");
  }

  @override
  onNegativeClick(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  onPositiveClick(BuildContext context) {
    Navigator.pop(context);
  }
}

class InformationShowWidget extends StatelessWidget {
  String header = "";
  String value = "";

  InformationShowWidget({super.key, required this.header, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                  color: Color(AppColors().titleTextColor),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Inter_medium'),
              child: Text(
                header,
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                  color: Color(AppColors().lightGreY60Opacity),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Inter_medium'),
              child: Text(value),
            ),
          ],
        ),
        DefaultTextStyle(
          style: TextStyle(
              color: Color(AppColors().newGreen),
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Inter_medium'),
          child: Text(
            "Change",
          ),
        ),
      ],
    );
  }
}
