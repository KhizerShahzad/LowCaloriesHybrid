import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Utills/CheckOutClickInterface.dart';
import 'package:lowcalories/Views/DashBoard/CalorieBreakDownItem.dart';
import 'package:lowcalories/Views/DashBoard/CalorieItem.dart';
import 'package:lowcalories/Views/DashBoard/DashBoardMenuItem.dart';
import 'package:lowcalories/Views/DashBoard/DeliverySelectorItem.dart';
import 'package:lowcalories/Views/DashBoard/YourMealPlan.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Image.asset(
                  fit: BoxFit.fitWidth,
                  'Assets/dashboard_image.jpg',
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: AppSizes().SectionSeprationSpace(context),
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultTextStyle(
                          style: AppStyles().fontInterBold(22),
                          child: Text("Weight Loss Plan"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(AppColors().lightGreen),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.005,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  color: Color(AppColors().newGreen)),
                              child: const Text("Recommended"),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: DefaultTextStyle(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            color: Color(AppColors().titleTextColor50opacity)),
                        child: Text(
                            "Give your immune system with your fitness\nand high protein goals"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes().SectionSeprationSpace(context)),
                      child: DefaultTextStyle(
                        style: AppStyles().fontInterBold(17),
                        child: Text("Choose Your meal type"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Consumer<GoalSelectionScreenNotifier>(
                        builder: (BuildContext context, value, Widget? child) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: EdgeInsets.only(
                                top: AppSizes().paddingWidthPoint3(context)),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.mealTypeList.length,
                              itemBuilder: (context, index) {
                                return DashboarMenuItem(
                                  itemIndex: index,
                                  notifier: value,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes().SectionSeprationSpace(context)),
                      child: DefaultTextStyle(
                        style: AppStyles().fontInterBold(17),
                        child: Text("Choose Your calories"),
                      ),
                    ),
                    Consumer<GoalSelectionScreenNotifier>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin: EdgeInsets.only(
                              top: AppSizes().paddingWidthPoint3(context)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: value.caloriesList.length,
                                itemBuilder: (context, index) {
                                  return CalorieItem(
                                    itemIndex: index,
                                    notifier: value,
                                  );
                                }),
                          ) /* Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 0.001,
                                        crossAxisSpacing: 0.001),
                                itemCount: value.caloriesList.length,
                                itemBuilder: (context, index) {
                                  return CalorieItem(
                                    itemIndex: index,
                                    notifier: value,
                                  );
                                }),
                          )*/
                          ,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes().SectionSeprationSpace(context)),
                      child: DefaultTextStyle(
                        style: AppStyles().fontInterBold(17),
                        child: Text("Choose days for delivery"),
                      ),
                    ),
                    Consumer<GoalSelectionScreenNotifier>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin: EdgeInsets.only(
                              top: AppSizes().paddingWidthPoint3(context)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: value.deliveryDaysList.length,
                                itemBuilder: (context, index) {
                                  return DeliverySelectorItem(
                                    itemIndex: index,
                                    notifier: value,
                                  );
                                }),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes().SectionSeprationSpace(context)),
                      child: DefaultTextStyle(
                        style: AppStyles().fontInterBold(17),
                        child: Text("Your calorie breakdown"),
                      ),
                    ),
                    Consumer<GoalSelectionScreenNotifier>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          margin: EdgeInsets.only(
                              top: AppSizes().paddingWidthPoint3(context)),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: value.calorieBreakdownItem.length,
                            itemBuilder: (context, index) {
                              return CalorieBreakDownListItem(
                                itemIndex: index,
                                notifier: value,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppSizes().SectionSeprationSpace(context),
                      ),
                      child: Stack(children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.117,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.03),
                            decoration: BoxDecoration(
                              color: Color(AppColors().grey85transparent),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.04,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Column(
                                children: [
                                  DefaultTextStyle(
                                    style: AppStyles()
                                        .fontInter400(15, Colors.white),
                                    child: Text(
                                      'Still Confused ?',
                                    ),
                                  ),
                                  DefaultTextStyle(
                                    style: AppStyles()
                                        .fontInter400(15, Colors.white),
                                    child: Text(
                                      'Contact our Nutritionist',
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02),
                          child: SvgPicture.asset("Assets/call_center.svg"),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes().paddingWidthPoint3(context),
                          bottom: AppSizes().SectionSeprationSpace(context)),
                      child: Center(
                        child: DefaultTextStyle(
                          style: AppStyles().fontRobotoWeight400(
                              19, Color(AppColors().titleTextColor)),
                          child: Text("or Discover other plans"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        PriceShow("Dashboard")
      ]),
    );
  }
}

class PriceShow extends StatelessWidget implements CheckOutButtonListner {
  PriceShow(
    this.screen, {
    super.key,
  });

  String screen = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            decoration: BoxDecoration(
              color: Color(AppColors().lightGrey),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04,
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.053),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultTextStyle(
                              style: AppStyles()
                                  .fontRobotoWeight300(14, Colors.black),
                              child: const Text(
                                'Meal plan price',
                              ),
                            ),
                            DefaultTextStyle(
                              style: AppStyles().fontRobotoWeight300(
                                  15, Color(AppColors().titleTextColor)),
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
                      top: MediaQuery.of(context).size.height * 0.004,
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.053),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultTextStyle(
                              style: AppStyles().fontRobotoWeightBold(
                                  18, Color(AppColors().titleTextColor)),
                              child: const Text(
                                'Subtotal',
                              ),
                            ),
                            DefaultTextStyle(
                              style: AppStyles().fontRobotoWeightBold(
                                  18, Color(AppColors().titleTextColor)),
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
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: InkWell(
                    onTap: () {
                      this.onCheckoutClick(context, screen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(AppColors().newGreen),
                              border: Border.all(
                                color: const Color.fromARGB(225, 222, 226, 230),
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: DefaultTextStyle(
                                style: AppStyles()
                                    .fontInter500Color(16, Colors.white),
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
    );
  }

  @override
  onCheckoutClick(BuildContext context, String type) {
    if (type == "Dashboard") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YourMealPlan()),
      );
    }
  }
}
