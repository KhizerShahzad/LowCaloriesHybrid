import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lowcalories/ChangeNotifiers/GoalSelectionProvider.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';
import 'package:lowcalories/Utills/AppBarClickInterface.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppSizes.dart';
import 'package:lowcalories/Utills/AppStyles.dart';
import 'package:lowcalories/Views/CommonWidgets/AppBarWithArrow.dart';
import 'package:lowcalories/Views/CommonWidgets/MapSelectionInputField.dart';
import 'package:lowcalories/Views/SignUp/PlaceItemCustom.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

/*class SelectDeliveryAddress extends StatelessWidget
    implements AppBarClickInterface {
  SelectDeliveryAddress({super.key});

  var uuid = Uuid();
  var sessionToken = "";
  late MapChangeNotifier mapChangeNotifier;

  void _onMapCreated(GoogleMapController controller) {
    var permission = mapChangeNotifier.getPermission();
    mapChangeNotifier.mapController = controller;
    var isPermissionAvailable = false;
    if (permission == LocationPermission.whileInUse) {
      isPermissionAvailable = true;
    } else if (permission == LocationPermission.always) {
      isPermissionAvailable = true;
    } else if (permission == LocationPermission.denied) {
    } else if (permission == LocationPermission.deniedForever) {}
    if (isPermissionAvailable = true) {
      mapChangeNotifier.getUserLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    mapChangeNotifier = Provider.of<MapChangeNotifier>(context, listen: false);

    mapChangeNotifier.placeInputController.addListener(() {
      onChange();
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
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
                Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Consumer<MapChangeNotifier>(builder:
                            (BuildContext context, value, Widget? child) {
                          return GoogleMap(
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            markers: Set<Marker>.of(value.markers),
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: value.userCurrentLocation.position,
                              zoom: 15.0,
                            ),
                            onTap: (position) {
                              value.getAddressFromLatLng(
                                  position.latitude, position.longitude);
                            },
                          );
                        })),
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
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
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              child: Visibility(
                                visible: mapChangeNotifier.placeListVisibility,
                                child: ListView.builder(
                                    itemCount: mapChangeNotifier.places.length,
                                    itemBuilder: (context, index) {
                                      return PlaceItemCustom(
                                        index: index,
                                        mapNotifier: mapChangeNotifier,
                                      );
                                    }),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppSizes().paddingHeightPoint1(context)),
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
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppSizes().paddingHeightPoint1(context)),
                              child: Consumer<MapChangeNotifier>(builder:
                                  (BuildContext context, value, Widget? child) {
                                return MapSelectionInput(
                                    notifier: value,
                                    imagePath: "",
                                    fieldText: "",
                                    fieldHint: "",
                                    controller: value.placeInputController);
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: AppSizes().paddingHeightPoint6(context),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(AppColors().newGreen),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              225, 222, 226, 230),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: Center(
                                        child: DefaultTextStyle(
                                          style: AppStyles().fontInter500Color(
                                              16, Colors.white),
                                          child: Text("Confirm"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onChange() {
    if (mapChangeNotifier.sessionToken == null) {
      mapChangeNotifier.sessionToken = uuid.v4();
    }

    mapChangeNotifier
        .getSuggestion(mapChangeNotifier.placeInputController.text);
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {}

  @override
  onBackClickWithoutNotifier(BuildContext context, String type) {
    Navigator.of(context).pop();
  }
}*/

class SelectDeliveryAddress extends StatefulWidget {
  const SelectDeliveryAddress({super.key});

  @override
  State<SelectDeliveryAddress> createState() => _SelectDeliveryAddressState();
}

class _SelectDeliveryAddressState extends State<SelectDeliveryAddress>
    implements AppBarClickInterface {
  var uuid = Uuid();
  var sessionToken = "";
  late MapChangeNotifier mapChangeNotifier;

  @override
  void initState() {
    super.initState();
    mapChangeNotifier = Provider.of<MapChangeNotifier>(context, listen: false);
    mapChangeNotifier.placeInputController.addListener(() {
      onChange();
    });

  }

  void onChange() {
    if (mapChangeNotifier.sessionToken == null) {
      mapChangeNotifier.sessionToken = uuid.v4();
    }

    mapChangeNotifier
        .getSuggestion(mapChangeNotifier.placeInputController.text,context);
  }

  void _onMapCreated(GoogleMapController controller) {
    var permission = mapChangeNotifier.getPermission();
    mapChangeNotifier.mapController = controller;
    var isPermissionAvailable = false;
    if (permission == LocationPermission.whileInUse) {
      isPermissionAvailable = true;
    } else if (permission == LocationPermission.always) {
      isPermissionAvailable = true;
    } else if (permission == LocationPermission.denied) {
    } else if (permission == LocationPermission.deniedForever) {}
    if (isPermissionAvailable = true) {
      mapChangeNotifier.getUserLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<GoalSelectionScreenNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: SafeArea(
                child: SingleChildScrollView(

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
                      Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: Consumer<MapChangeNotifier>(builder:
                                  (BuildContext context, value, Widget? child) {
                                return GoogleMap(
                                  myLocationButtonEnabled: true,
                                  myLocationEnabled: true,
                                  markers: Set<Marker>.of(value.markers),
                                  onMapCreated: _onMapCreated,
                                  initialCameraPosition: CameraPosition(
                                    target: value.userCurrentLocation.position,
                                    zoom: 15.0,
                                  ),
                                  onTap: (position) {
                                    value.getAddressFromLatLng(
                                        position.latitude, position.longitude);
                                  },
                                );
                              })),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
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
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultTextStyle(
                                    style: TextStyle(
                                        color:
                                            Color(AppColors().titleTextColor),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        fontFamily: 'inter_semibold'),
                                    child: Text(
                                      "Choose your location",
                                    ),

                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSizes()
                                            .paddingHeightPoint1(context)),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          color:
                                          Color(AppColors().titleTextColor),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          fontFamily: 'Inter'),
                                      child: Text(
                                        "You can change it anytime in the future",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: mapChangeNotifier.placeListHeight,
                                    width: MediaQuery.of(context).size.width,
                                    child: Visibility(
                                      visible:
                                      mapChangeNotifier.placeListVisibility,
                                      child: ListView.builder(
                                          itemCount:
                                          mapChangeNotifier.places.length,
                                          itemBuilder: (context, index) {
                                            return PlaceItemCustom(
                                              index: index,
                                              mapNotifier: mapChangeNotifier,
                                            );
                                          }),
                                    ),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSizes()
                                            .paddingHeightPoint1(context)),
                                    child: Consumer<MapChangeNotifier>(builder:
                                        (BuildContext context, value,
                                            Widget? child) {
                                      return MapSelectionInput(
                                          notifier: value,
                                          imagePath: "",
                                          fieldText: "",
                                          fieldHint: "",
                                          controller:
                                              value.placeInputController);
                                    }),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: AppSizes()
                                          .paddingHeightPoint6(context),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color:
                                                  Color(AppColors().newGreen),
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                    225, 222, 226, 230),
                                                width: 2,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Center(
                                              child: DefaultTextStyle(
                                                style: AppStyles()
                                                    .fontInter500Color(
                                                        16, Colors.white),
                                                child: Text("Confirm"),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          ;
        },
      ),
    );
  }

  @override
  onBackClick(BuildContext context, String type,
      {GoalSelectionScreenNotifier? value}) {
    value?.updateStage(isForward: false, mContext: context);
  }

  @override
  onBackClickWithoutNotifier(BuildContext context, String type) {}
}
