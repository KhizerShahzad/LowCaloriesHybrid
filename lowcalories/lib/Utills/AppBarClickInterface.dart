import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';

abstract class AppBarClickInterface {
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value});

  onBackClickWithoutNotifier(
    BuildContext context,
    String type,
  );
}
