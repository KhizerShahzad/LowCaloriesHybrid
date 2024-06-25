import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/HomeProvider.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Views/SignInSelectionScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GoalSelectionScreenNotifier>(
          create: (_) => GoalSelectionScreenNotifier()),
      ChangeNotifierProvider<MapChangeNotifier>(
        create: (_) => MapChangeNotifier(),
      ),
      ChangeNotifierProvider<HomeNotifier>(create: (_) => HomeNotifier())
    ],
    child: MyApp(),
  ));
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
