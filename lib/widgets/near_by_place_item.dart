import 'package:flutter/material.dart';
import 'package:place_picker/entities/entities.dart';

class NearbyPlaceItem extends StatelessWidget {
  final NearbyPlace nearbyPlace;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  NearbyPlaceItem(this.nearbyPlace, this.onTap, this.textStyle);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: <Widget>[
              Image.network(nearbyPlace.icon!, width: 16),
              SizedBox(width: 24),
              Expanded(
                child: Text(
                  "${nearbyPlace.name}",
                  style:
                      textStyle ?? TextStyle(fontSize: 16, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
