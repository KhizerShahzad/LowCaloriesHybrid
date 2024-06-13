import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lowcalories/ChangeNotifiers/MapChangeNotifier.dart';

class PlaceItemCustom extends StatelessWidget {
  PlaceItemCustom({super.key, required this.index, required this.mapNotifier});

  var index = 0;
  late MapChangeNotifier mapNotifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mapNotifier.placeInputController.text =
            mapNotifier.places[index]['description'];
        /*  mapNotifier.samplePlaces[index];*/
        mapNotifier.clearPlacesList();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.85,
              child: DefaultTextStyle(
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Roboto'),
                child: Text(
                  mapNotifier.places[index]['description'],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
