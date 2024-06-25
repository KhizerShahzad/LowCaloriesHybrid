import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/HomeProvider.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Utills/Interfaces/HomeAppBarClickInterface.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarHomeDashboard.dart';
import 'package:provider/provider.dart';

class HomeDashboard extends StatelessWidget
    implements HomeAppBarClickInterface {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xffFFFFFF),
        child: ListView(
          shrinkWrap: true,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  Image.asset(
                    fit: BoxFit.fitWidth,
                    'Assets/user_profile_place_holder.png',
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultTextStyle(
                      style: AppStyles().fontRobotoWeight500(
                          16, Color(AppColors().titleTextColor)),
                      child: Text("Welcome User"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SideMenuTile(
                title: "Home",
              ),
            ),
            SideMenuTile(
              title: "Choose a Plan",
            ),
            SideMenuTile(
              title: "Personal Information",
            ),
            SideMenuTile(
              title: "Dietary Preferences",
            ),
            SideMenuTile(
              title: "Nutrition Consultations",
            ),
            SideMenuTile(
              title: "Payment Methods",
            ),
            SideMenuTile(
              title: "Meal plans",
            ),
            SideMenuTile(
              title: "Track Plan Progress",
            ),
            SideMenuTile(
              title: "Track my progress",
            ),
            SideMenuTile(
              title: "BMI Calculator",
            ),
            SideMenuTile(
              title: "Calories Calculator",
            ),
            SideMenuTile(
              title: "Online Clinic",
            ),
            SideMenuTile(
              title: "Schedule & Reminders",
            ),
            SideMenuTile(
              title: "Contact Us",
            ),
            SideMenuTile(
              title: "Terms & Conditions",
            ),
            SideMenuTile(
              title: "Privacy Policy",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Consumer<HomeNotifier>(
          builder: (BuildContext context, value, Widget? child) {
            return PopScope(
              canPop: false,
              onPopInvoked: (isPoped) {
                Navigator.pop(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarHomeDashboard(
                      appBarText: "Home",
                      appBarClickInterface: this,
                      screenName: ""),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: AppSizes().GoalSelectionTop(context)),
                      margin: EdgeInsets.only(right: 15, left: 15),
                      child: value.returnSelectedScreen("Home", context),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  hamBurgerListener(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  profileClickListener(BuildContext context) {}
}

class SideMenuTile extends StatelessWidget {
  SideMenuTile({super.key, required this.title});

  String title = "";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: DefaultTextStyle(
        style: AppStyles()
            .fontRobotoWeight500(16, Color(AppColors().titleTextColor)),
        child: Text(title),
      ),
      onTap: () {

      },
      trailing: SvgPicture.asset("Assets/ic_next.svg"),
    );
  }
}
