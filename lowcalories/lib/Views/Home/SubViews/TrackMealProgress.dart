import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppStyles.dart';

class MealPlanProgress extends StatelessWidget {
  const MealPlanProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DefaultTextStyle(
              style: TextStyle(
                  color: Color(AppColors().blackColor),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'Inter_medium'),
              child: Text("Overall Plan Progress "),
            ),
          ],
        ),
      ],
    );
  }
}
