import 'dart:convert';
import 'address_details.dart';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

class Address {
  final int placeId;
  final String lat;
  final String lon;
  final String displayName;
  final List<String> boundingBox;
  final AddressDetails addressDetails;

  Address(
      {required this.placeId,
      required this.lat,
      required this.lon,
      required this.displayName,
      required this.boundingBox,
      required this.addressDetails});
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        placeId: json["place_id"],
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        addressDetails: AddressDetails.fromJson(json["address"]),
        boundingBox: List<String>.from(json["boundingbox"].map((x) => x)),
      );
}
