import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    implements AppBarClickInterface {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            color: Colors.white,
            child: PopScope(
              canPop: false,
              onPopInvoked: (isPoped) {},
              child: SafeArea(
                child: AppBarWithArrow(
                  appBarClickInterface: this,
                  appBarText: "Sign Up",
                  screenName: "",
                  notifier: GoalSelectionScreenNotifier(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {}
}


