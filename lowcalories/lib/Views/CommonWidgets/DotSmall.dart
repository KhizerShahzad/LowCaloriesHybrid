import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/Utills/AppColors.dart';

class DotSmall extends StatelessWidget {
  const DotSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(AppColors().lightGreY3Opacity),
        shape: BoxShape.circle,
        border:
        Border.all(width: 5.0, color: Color(AppColors().lightGreY3Opacity)),
      ),
      height: 8,
      width: 8,
    );
  }
}