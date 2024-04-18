import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Image.asset(
              fit: BoxFit.fitWidth,
              'Assets/dashboard_image.jpg',
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width *2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,top: AppSizes().SectionSeprationSpace(context),right: MediaQuery.of(context).size.width*0.05,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle(
                      style: AppStyles().fontInterBold(22),
                      child: Text(
                        "Weight Loss Plan"
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color(AppColors().lightGreen),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.005,
                            horizontal: MediaQuery.of(context).size.width*0.03),
                        child: DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              color: Color(AppColors().newGreen)),
                          child: const Text(
                           "Recomended"
                          ),
                        ),
                      ),
                    )
                  ],

                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(AppColors().titleTextColor50opacity)),
                    child: Text(
                        "Give your immune system with your fitness\nand high protein goals"
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:AppSizes().SectionSeprationSpace(context)),
                  child: DefaultTextStyle(
                    style: AppStyles().fontInterBold(17),
                    child: Text(
                        "Choose Your meal type"
                    ),
                  ),
                )
              ],

            ),
          )
        ],
      ),
    );
  }
}
