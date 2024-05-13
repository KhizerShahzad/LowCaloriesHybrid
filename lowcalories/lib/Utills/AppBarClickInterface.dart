import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';

abstract class AppBarClickInterface {
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value});
}
