import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:lowcalories/Views/CommonWidgets/DecoratedTextFieldWithoutImage.dart';
import 'package:lowcalories/Views/CommonWidgets/TextStart.dart';
import 'package:lowcalories/Views/SignUp/SelectDeliveryAdress.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    implements AppBarClickInterface {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
      return Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      AppBarWithArrow(
                        appBarClickInterface: this,
                        appBarText: "Log In",
                        screenName: "",
                        notifier: value,
                      ),
                      Column(
                        children: [
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
                            controller: value.emailAddressController,
                            fieldUnit: "",
                            isPasswordField: false,
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
                            controller: value.passWordController,
                            fieldUnit: "",
                            isPasswordField: true,
                          ),
                          InkWell(
                            onTap: () {
                              if (value.emailAddressController.text.isEmpty) {
                                value.showPrompt(
                                    context, "Enter Email Address");
                              } else if (value
                                  .passWordController.text.isEmpty) {
                                value.showPrompt(context, "Enter Password");
                              } else {
                                value.userProfile.firstName =
                                    value.firstNameController.text;
                                value.userProfile.lastName =
                                    value.lastNameController.text;
                                value.userProfile.emailAdress =
                                    value.emailAddressController.text;
                                value.userProfile.passWord =
                                    value.emailAddressController.text;
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
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
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectDeliveryAdress()),
                                          );
                                        },
                                        child: Center(
                                          child: DefaultTextStyle(
                                            style: AppStyles()
                                                .fontInter500Color(
                                                    16, Colors.white),
                                            child: Text("Log In"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {
    Navigator.of(context).pop();
  }
}
