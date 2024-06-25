import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/Interfaces/HomeAppBarClickInterface.dart';

class AppBarHomeDashboard extends StatelessWidget {
  AppBarHomeDashboard({
    super.key,
    required this.appBarText,
    required this.appBarClickInterface,
    required this.screenName,
  });

  String appBarText;
  String screenName;
  HomeAppBarClickInterface appBarClickInterface;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  appBarClickInterface.hamBurgerListener(context);
                },
                child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: SvgPicture.asset("Assets/ic_ham_burger.svg")),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                      color: Color(AppColors().deppDark),
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      fontFamily: 'Roboto'),
                  child: Text(
                    appBarText,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(right: 15),
                    child:
                        SvgPicture.asset("Assets/ic_profile_place_holder.svg")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
