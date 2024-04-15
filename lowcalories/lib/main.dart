import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/Views/SignInSelectionScreen.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GoalSelectionScreenNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}




