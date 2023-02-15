import 'dart:convert';


List<LookupAddress> suggestionListFromJson(response) => List<LookupAddress>.from(
    jsonDecode(response.body).map((x) => LookupAddress.fromJson(x)));

class LookupAddress {
  final int placeId;
  final String latitude;
  final String longitude;
  final String displayName;
  final List<String> boundingBox;

  LookupAddress(
      {required this.placeId,
        required this.latitude,
        required this.longitude,
        required this.displayName,
        required this.boundingBox,
        });
  factory LookupAddress.fromJson(Map<String, dynamic> json) => LookupAddress(
    placeId: json["place_id"],
    latitude: json["lat"],
    longitude: json["lon"],
    displayName: json["display_name"],
    boundingBox: List<String>.from(json["boundingbox"].map((x) => x)),
  );
}
