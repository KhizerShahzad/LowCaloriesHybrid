import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lowcalories/Utills/AppColors.dart';

class TextStart extends StatelessWidget {
  TextStart({super.key, required this.lableText,required this.textStyle});

  var lableText = "";
  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: textStyle,
          child: Text(lableText),
        ),
      ],
    );
  }
}
