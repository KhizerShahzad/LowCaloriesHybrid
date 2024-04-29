import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Views/DashBoard/CalorieBreakDownItem.dart';
import 'package:lowcalories/Views/DashBoard/CalorieItem.dart';
import 'package:lowcalories/Views/DashBoard/DashBoard.dart';
import 'package:lowcalories/Views/DashBoard/DashBoardMenuItem.dart';
import 'package:lowcalories/Views/DashBoard/DeliverySelectorItem.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: PopScope(
          canPop: false,
          onPopInvoked: (isPoped) {

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
                  ""
                          ),
                        ),
                      )
                    ],
                  ),

                  Expanded(flex: 1, child: Padding(
                    padding:  EdgeInsets.only(top: AppSizes().GoalSelectionTop(context)),
                    child: Container(),
                  )),
                ],
              ),
            ),
          ),
        ),
      );
    );
  }
}


