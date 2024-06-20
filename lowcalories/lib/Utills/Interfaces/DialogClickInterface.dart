import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';

abstract class DialogClickInterface {
  onPositiveClick(BuildContext context);

  onNegativeClick(
    BuildContext context,
  );
}
