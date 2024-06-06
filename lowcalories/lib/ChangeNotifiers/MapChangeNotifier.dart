import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lowcalories/Models/CalorieItem.dart';
import 'package:lowcalories/Models/MealItem.dart';
import 'package:lowcalories/Views/DashBoard/DashBoard.dart';
import 'package:lowcalories/Views/SignInSelectionScreen.dart';
import 'package:lowcalories/Views/GoalSelection/Step1Screen.dart';
import 'package:lowcalories/Views/GoalSelection/Step3Screen.dart';
import 'package:lowcalories/Views/GoalSelection/Step4Screen.dart';
import 'package:lowcalories/Models/UserProfile.dart';
import 'package:lowcalories/Utills/AppColors.dart';
import 'package:lowcalories/Utills/AppStrings.dart';
import 'package:lowcalories/Models/ListModel.dart';

import '../Views/GoalSelection/Step2Screen.dart';

class MapChangeNotifier with ChangeNotifier {
  var stageText = AppStrings().goalScreen1Text;
  late GoogleMapController mapController;
  var selectedLocationText = "";
  var userCurrentLocation = Marker(
      markerId: MarkerId('Initial location'),
      position: LatLng(0, 0),
      infoWindow: InfoWindow(title: "Initial Position"));

  moveCamera(LatLng userLongitudes) {
    CameraPosition cameraPosition;
    cameraPosition = CameraPosition(zoom: 50, target: userLongitudes);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  TextEditingController placeInputController = TextEditingController();
  List<Marker> markers = [];

  updateMarkers(LatLng location) {
    markers.add(Marker(
        markerId: MarkerId('Current Location'),
        position: location,
        infoWindow: InfoWindow(title: "My Current Location")));
    notifyListeners();
  }

  Future<LocationPermission> getPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  Future<LatLng> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error);
    });

    Geolocator.getCurrentPosition().then((value) {
      userCurrentLocation = Marker(
          markerId: MarkerId('User Location'),
          position: LatLng(value.latitude, value.longitude));
      var cameraPosition = CameraPosition(
          zoom: 40, target: LatLng(value.latitude, value.longitude));
      return cameraPosition;
    });

    return userCurrentLocation.position;
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    await GeocodingPlatform.instance!
        .placemarkFromCoordinates(latitude, longitude)
        .then((value) {
      Placemark place = value[0];
      selectedLocationText =place.street!.toString()+place.name!.toString()+
        place.locality!.toString()+place.subLocality!.toString()+place.country!.toString();
      placeInputController.text=selectedLocationText;
      markers.add(Marker(
          markerId: MarkerId(selectedLocationText),
          position: LatLng(latitude, longitude),infoWindow: InfoWindow(title: selectedLocationText)));
      notifyListeners();
      moveCamera(LatLng(latitude, longitude));
    }).catchError((e) {
      debugPrint(e);
    });
  }

  showPrompt(BuildContext mContext, String message) {
    showDialog(
        context: mContext,
        builder: (mContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(mContext).size.height * 0.013,
                horizontal: MediaQuery.of(mContext).size.width * 0.03),
            title: Text(
              'Info',
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
                  Navigator.pop(mContext);
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
                  Navigator.pop(mContext);
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
