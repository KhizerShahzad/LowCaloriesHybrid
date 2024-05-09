import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class YourMealPlan extends StatelessWidget {
  YourMealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: PopScope(
        canPop: false,
        onPopInvoked: (isPoped) {},
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(AppColors().backgroundGrey),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0)),
                  border: Border.all(
                      color: Color(AppColors().lightGreY15Opacity), width: 2),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child:
                                SvgPicture.asset('Assets/custom_back_grey.svg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  color: Color(AppColors().deppDark),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  fontFamily: 'Inter'),
                              child: Text("Your meal plan"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppSizes().GoalSelectionTop(context),
                        right: 20,
                        left: 20,
                        bottom: 10,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      fontFamily: 'Inter'),
                                  child: Text(
                                      DateFormat.MMMM().format(DateTime.now()) +
                                          " " +
                                          DateTime.now().year.toString()),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: AppSizes().GoalSelectionTop(context),
                                bottom: 10,
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 1)
                                            .day
                                            .toString(),
                                        "Mon"),
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 2)
                                            .day
                                            .toString(),
                                        "Tue"),
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 3)
                                            .day
                                            .toString(),
                                        "Wed"),
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 4)
                                            .day
                                            .toString(),
                                        "Thu"),
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 5)
                                            .day
                                            .toString(),
                                        "Fri"),
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 6)
                                            .day
                                            .toString(),
                                        "Sat"),
                                    DateHolder(
                                        context,
                                        mostRecentMonday(DateTime.now(), 7)
                                            .day
                                            .toString(),
                                        "Sun"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: AppSizes().GoalSelectionTop(context),
                    right: 20,
                    left: 20),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: TextStyle(
                              color: Color(AppColors().titleTextColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: 'Inter'),
                          child: Text("Your macros"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 150,
                          width: 150,
                          child: SfRadialGauge(axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 1600,
                              showLabels: false,
                              showTicks: false,
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.2,
                                cornerStyle: CornerStyle.bothCurve,
                                color: Color.fromARGB(30, 0, 169, 181),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  color: Color(AppColors().newGreen),
                                  value: 1000,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 0.2,
                                  sizeUnit: GaugeSizeUnit.factor,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    positionFactor: 0.1,
                                    angle: 90,
                                    widget: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Text(
                                        "Calories\n",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )),
                                GaugeAnnotation(
                                    positionFactor: 0.1,
                                    angle: 90,
                                    widget: Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Text(
                                        "1000",
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    )),
                                GaugeAnnotation(
                                    positionFactor: 0.1,
                                    angle: 90,
                                    widget: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Text(
                                        "1600 Target",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ))
                              ],
                            )
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(
                                            color: Color(
                                                AppColors().titleTextColor),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            fontFamily: 'Inter'),
                                        child: Text("Protein"),
                                      ),
                                    ],
                                  ),
                                  LinearProgressIndicator(
                                    minHeight: 8,
                                    value: 50,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget DateHolder(BuildContext context, String date, String day) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          height: MediaQuery.of(context).size.height * 0.135,
          width: MediaQuery.of(context).size.width * 0.13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24)),
            color: Color(AppColors().lightGreenDays),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: DefaultTextStyle(
                  style: TextStyle(
                      color: Color(AppColors().titleTextColor),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Inter'),
                  child: Text(day),
                ),
              )
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24)),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'Inter'),
                child: Text(date),
              ),
            ))
      ]),
    );
  }

  DateTime mostRecentMonday(DateTime date, int difference) =>
      DateTime(date.year, date.month, date.day - (date.weekday - difference));
}
