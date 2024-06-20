import 'package:flutter/material.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/Interfaces/DialogClickInterface.dart';

class UtillMethods {
  static final UtillMethods _AppStyles = UtillMethods._privateConstructor();

  factory UtillMethods() => _AppStyles;

  UtillMethods._privateConstructor();

  showPrompt(BuildContext mContext, String message,DialogClickInterface dialogClickInterface ,{String header = 'Info'}) {
    showDialog(
        context: mContext,
        builder: (mContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(mContext).size.height * 0.013,
                horizontal: MediaQuery.of(mContext).size.width * 0.03),
            title: Text(
              header,
              style: TextStyle(
                  fontSize: 23,
                  color: Color(
                    AppColors().popUpHeaderColor,
                  ),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(mContext).size.width * 0.023),
                  child: Text(message,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            AppColors().popUpBodyTextColor,
                          ),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  dialogClickInterface.onNegativeClick(mContext);

                },
                child: Text(
                  'Close',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(
                        AppColors().titleTextColor,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {
                  dialogClickInterface.onPositiveClick(mContext);

                },
                child: Text(
                  'Okay',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(
                        AppColors().newGreen,
                      ),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        });
  }
}
