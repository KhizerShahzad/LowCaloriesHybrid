import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStrings.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Views/DashBoard/DashBoard.dart';

class HomeNotifier with ChangeNotifier {
  var stageText = AppStrings().goalScreen1Text;

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

  Widget returnSelectedScreen(String screenId, BuildContext context) {
    if (screenId == "Home") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 21,
                fontFamily: 'Inter_medium'),
            child: Text("Discover our Plans"),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.008),
            child: DefaultTextStyle(
              style: TextStyle(
                  color: Color(AppColors().lightGreY60Opacity),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'Inter_regular'),
              child: Text("Choose the meal plan for your goals"),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
            child: StillConfusedHomeWidget(
              message: "Need a personalized meal plan?\n" + "Let’s Go!",
            ),
          )
        ],
      );
    }
    return Container();
  }
}

class StillConfusedHomeWidget extends StatelessWidget {
  String message = "";

  StillConfusedHomeWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.117,
          width: MediaQuery.of(context).size.width,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          decoration: BoxDecoration(
            color: Color(AppColors().grey85transparent),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.width * 0.2),
            child: Column(
              children: [
                DefaultTextStyle(
                  style: AppStyles().fontInter400(15, Colors.white),
                  child: Text(
                    message,
                  ),
                ),
                /*   DefaultTextStyle(
                  style: AppStyles().fontInter400(15, Colors.white),
                  child: Text(
                    ,
                  ),
                )*/
              ],
            ),
          )),
      Container(
        margin:
            EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.02),
        child: SvgPicture.asset("Assets/call_center.svg"),
      ),
    ]);
  }
}
