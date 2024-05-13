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
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:lowcalories/Views/CommonWidgets/DecoratedTextField.dart';
import 'package:lowcalories/Views/CommonWidgets/DecoratedTextFieldWithoutImage.dart';
import 'package:lowcalories/Views/CommonWidgets/TextStart.dart';
import 'package:lowcalories/Views/GoalSelection/Step2Screen.dart';
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
    return Material(child: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
      return Container(
        color: Colors.white,
        child: PopScope(
          canPop: false,
          onPopInvoked: (isPoped) {},
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  AppBarWithArrow(
                    appBarClickInterface: this,
                    appBarText: "Sign Up",
                    screenName: "",
                    notifier: GoalSelectionScreenNotifier(),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: TextStart(
                          lableText: "First Name",
                          textStyle: AppStyles().fontInterBold(14),
                        ),
                      ),
                      InputTextFieldDecoratedWithoutImage(
                        notifier: value,
                        fieldHint: "First Name",
                        fieldText: value.userProfile.firstName.isEmpty
                            ? ""
                            : value.userProfile.firstName,
                        controller: value.firstNameController,
                        fieldUnit: "",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextStart(
                          lableText: "Last Name",
                          textStyle: AppStyles().fontInterBold(14),
                        ),
                      ),
                      InputTextFieldDecoratedWithoutImage(
                        notifier: value,
                        fieldHint: "Last Name",
                        fieldText: value.userProfile.lastName.isEmpty
                            ? ""
                            : value.userProfile.lastName,
                        controller: value.lastNameController,
                        fieldUnit: "",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextStart(
                          lableText: "Email Address",
                          textStyle: AppStyles().fontInterBold(14),
                        ),
                      ),
                      InputTextFieldDecoratedWithoutImage(
                        notifier: value,
                        fieldHint: "Email Address",
                        fieldText: value.userProfile.lastName.isEmpty
                            ? ""
                            : value.userProfile.lastName,
                        controller: value.lastNameController,
                        fieldUnit: "",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextStart(
                          lableText: "Password",
                          textStyle: AppStyles().fontInterBold(14),
                        ),
                      ),
                      InputTextFieldDecoratedWithoutImage(
                        notifier: value,
                        fieldHint: "Password",
                        fieldText: value.userProfile.lastName.isEmpty
                            ? ""
                            : value.userProfile.lastName,
                        controller: value.lastNameController,
                        fieldUnit: "",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(AppColors().newGreen),
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
                                        .fontInter500Color(16, Colors.white),
                                    child: Text("Sign Up"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {}
}
