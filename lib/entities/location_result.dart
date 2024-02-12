import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/address_component.dart';

/// The result returned after completing location selection.
class LocationResult {
  /// The human readable name of the location. This is primarily the
  /// name of the road. But in cases where the place was selected from Nearby
  /// places list, we use the <b>name</b> provided on the list item.
  String? name; // or road

  /// Latitude/Longitude of the selected location.
  LatLng? latLng;

  /// Formatted address suggested by Google
  String? formattedAddress;

  AddressComponent? country;

  AddressComponent? city;

  AddressComponent? administrativeAreaLevel1;

  AddressComponent? administrativeAreaLevel2;

  AddressComponent? subLocalityLevel1;

  AddressComponent? subLocalityLevel2;

  AddressComponent? postalCode;

  String? placeId;

  String? get locality => city?.name;

  Map<String, dynamic> get toMap {
    return {
      "placeId": placeId,
      "name": name,
      "latitude": latLng?.latitude,
      "longitude": latLng?.longitude,
      "formattedAddress": formattedAddress,
      "country": country?.toMap,
      "city": city?.toMap,
      "administrativeAreaLevel1": administrativeAreaLevel1?.toMap,
      "administrativeAreaLevel2": administrativeAreaLevel2?.toMap,
      "subLocalityLevel1": subLocalityLevel1?.toMap,
      "subLocalityLevel2": subLocalityLevel2?.toMap,
      "postalCode": postalCode?.toMap,
    };
  }
}
