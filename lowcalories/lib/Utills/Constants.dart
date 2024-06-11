import 'dart:convert';
import 'package:flutter/material.dart';

class Constants {
  static final Constants _constants = Constants._privateConstructor();

  factory Constants() => _constants;

  Constants._privateConstructor();

  var mapsKey = "AIzaSyBs4vpoJoWZ2G4yEr33sMYhGPAAHQNdDFo";
  var mapsBaseURLNewPlacesAPI =
      "https://places.googleapis.com/v1/places/GyuEmsRBfy61i59si0?fields=addressComponents&key=AIzaSyBs4vpoJoWZ2G4yEr33sMYhGPAAHQNdDFo";
}
