import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Views/CommonWidgets/DecoratedTextFieldWithoutUnit.dart';

class MapSelectionInput extends StatelessWidget {
  String fieldHint = "";
  String fieldText = "";
  var selectedLongitude = 0.0;
  var selectedLatitude = 0.0;
  var imagePath = "";
  MapChangeNotifier notifier;
  TextEditingController controller;

  MapSelectionInput(
      {super.key,
      required this.notifier,
      required this.imagePath,
      required this.fieldText,
      required this.fieldHint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes().spaceBetweenItems(context)),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.5,
          color: Color(AppColors().itemShadow),
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(AppColors().itemBack),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.all(12),
                          child: SvgPicture.asset("Assets/Search.svg")),
                      DecoratedTextFieldWithoutFieldUnit(
                          fieldHint, "", controller, notifier),
                      InkWell(
                        onTap: () {
                          controller.text = "";
                          notifier.clearPlacesList();
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 0),
                            child: SvgPicture.asset("Assets/cross.svg")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
