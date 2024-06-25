import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';

abstract class HomeAppBarClickInterface {
  hamBurgerListener(
    BuildContext context,
  );

  profileClickListener(BuildContext context);
}
