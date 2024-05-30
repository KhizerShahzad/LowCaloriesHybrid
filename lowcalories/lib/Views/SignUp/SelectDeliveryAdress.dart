import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:provider/provider.dart';

class SelectDeliveryAdress extends StatelessWidget
    implements AppBarClickInterface {
  SelectDeliveryAdress({super.key});

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 15,
                  left: 15,
                ),
                child: AppBarWithArrow(
                    appBarText: "Delivery Address",
                    appBarClickInterface: this,
                    screenName: "",
                    notifier: GoalSelectionScreenNotifier()),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Consumer<GoalSelectionScreenNotifier>(
                      builder: (BuildContext context, value, Widget? child) {
                    return Stack(
                      children: [
                        GoogleMap(
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: value.userCurrentLocation.position,
                            zoom: 15.0,
                          ),
                          onTap: (position) {
                            value.getAddressFromLatLng(
                                position.latitude, position.longitude);
                          },
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.18,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    var userLongitudes =
                                        value.getUserLocation();

                                    CameraPosition cameraPosition;
                                    userLongitudes.then((value) => {
                                          cameraPosition = CameraPosition(
                                              zoom: 40, target: value),
                                          mapController.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                  cameraPosition))
                                        });
                                  },
                                  child: Icon(Icons.location_disabled_sharp),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  })),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0)),
                  border: Border.all(
                    width: 1,
                    color: Color(AppColors().itemShadow),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                            color: Color(AppColors().titleTextColor),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'inter_semibold'),
                        child: Text(
                          "Choose your location",
                        ),
                      ),
                      Consumer<GoalSelectionScreenNotifier>(builder:
                          (BuildContext context, value, Widget? child) {
                        return DefaultTextStyle(
                          style: TextStyle(
                              color: Color(AppColors().titleTextColor),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'inter_semibold'),
                          child: Text(value.selectedLocationText),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSizes().spaceBetweenItems(context)),
                        child: DefaultTextStyle(
                          style: TextStyle(
                              color: Color(AppColors().titleTextColor),
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: 'Inter'),
                          child: Text(
                            "You can change it anytime in the future",
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(AppColors().newGreen),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(225, 222, 226, 230),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: DefaultTextStyle(
                                  style: AppStyles()
                                      .fontInter500Color(16, Colors.white),
                                  child: Text("Confirm"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {
    Navigator.of(context).pop();
  }
}
