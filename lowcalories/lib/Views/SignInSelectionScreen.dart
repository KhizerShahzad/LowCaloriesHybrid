import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/Views/GoalSelection/GoalSelection.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Views/SignUp/SignInScreen.dart';

class SignInSelectionScreen extends StatelessWidget {
  const SignInSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (isPoped) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'ALERT',
                style: TextStyle(fontSize: 20),
              ),
              content: const Text('Are you sure you want to Exit?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No'),
                ),
              ],
            ),
          );
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DefaultTextStyle(
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 29,
                                    fontFamily: 'Futura',
                                    color: Color(AppColors().deppDark)),
                                child: Text(
                                  'Welcome To',
                                ),
                              ),
                              DefaultTextStyle(
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 64,
                                    fontFamily: 'Futura',
                                    color: Color(AppColors().newGreen)),
                                child: Text(
                                  'LOW',
                                ),
                              ),
                              DefaultTextStyle(
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Futura',
                                    fontSize: 64,
                                    color: Color(AppColors().deppDark)),
                                child: Text(
                                  'Calories'.toUpperCase(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  fit: BoxFit.fitHeight,
                                  'Assets/sign_in_small_dish.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.27,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                ),
                              ],
                            ),
                            Image.asset(
                              fit: BoxFit.fitHeight,
                              'Assets/sign_in_option_big_food.jpg',
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            fit: BoxFit.fill,
                            'Assets/bottom_sign_in_selection.jpg',
                            height: MediaQuery.of(context).size.height * 0.21,
                            width: MediaQuery.of(context).size.width * 1,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoalSelection()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .021,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .021,
                                      right: MediaQuery.of(context).size.width *
                                          .1,
                                      left: MediaQuery.of(context).size.width *
                                          .1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(AppColors().deppDark),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          225, 222, 226, 230),
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Text(
                                    "Make A Plan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: 'Roboto'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .021,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .021,
                                      right: MediaQuery.of(context).size.width *
                                          .13,
                                      left: MediaQuery.of(context).size.width *
                                          .13),
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
                                  child: Text(
                                    "Discover",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: 'Roboto'),
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()),
                                );
                              },
                              child: Center(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Already have an account?',
                                          style: TextStyle(
                                              color:
                                                  Color(AppColors().deppDark),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: 'Roboto'),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Sign in ',
                                                style: TextStyle(
                                                    color: Color(
                                                        AppColors().deppDark),
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 16,
                                                    fontFamily: 'Roboto')),
                                          ],
                                        ),
                                      ))),
                            ),
                          ],
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
    );
  }
}
