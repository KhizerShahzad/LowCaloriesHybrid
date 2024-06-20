import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/Interfaces/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Utills/Interfaces/DialogClickInterface.dart';
import 'package:lowcalories/Utills/UtillMethods.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:lowcalories/Views/CommonWidgets/InputTextFieldDecoratedWithoutImage.dart';
import 'package:lowcalories/Views/CommonWidgets/TextStart.dart';
import 'package:lowcalories/Views/SignUp/SignInScreen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    implements AppBarClickInterface, DialogClickInterface {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  AppBarWithArrow(
                      appBarClickInterface: this,
                      appBarText: "Sign Up",
                      screenName: "sign_up",
                      notifier: value),
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
                        isPasswordField: false,
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
                        isPasswordField: false,
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
                          if (value.firstNameController.text.isEmpty) {
                            UtillMethods()
                                .showPrompt(context, "Enter First Name", this);
                          } else if (value.lastNameController.text.isEmpty) {
                            UtillMethods()
                                .showPrompt(context, "Enter Last Name", this);
                          } else if (value
                              .emailAddressController.text.isEmpty) {
                            UtillMethods().showPrompt(
                                context, "Enter Email Address", this);
                          } else if (value.passWordController.text.isEmpty) {
                            UtillMethods()
                                .showPrompt(context, "Enter Password", this);
                          } else {
                            value.userProfile.firstName =
                                value.firstNameController.text;
                            value.userProfile.lastName =
                                value.lastNameController.text;
                            value.userProfile.emailAdress =
                                value.emailAddressController.text;
                            value.userProfile.passWord =
                                value.emailAddressController.text;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()),
                            );
                          }
                        },
                        child: Padding(
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
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        },
                        child: Center(
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.03),
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                        color: Color(AppColors().deppDark),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: 'Roboto'),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Sign in ',
                                          style: TextStyle(
                                              color:
                                                  Color(AppColors().deppDark),
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 16,
                                              fontFamily: 'Roboto')),
                                    ],
                                  ),
                                ))),
                      ),
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

  @override
  onBackClickWithoutNotifier(BuildContext context, String type) {
    Navigator.of(context).pop();
  }

  @override
  onNegativeClick(BuildContext context) {}

  @override
  onPositiveClick(BuildContext context) {}
}
