class AddressDetails {
  final String houseNumber;
  final String road;
  final String neighbourhood;
  final String hamlet;
  final String city;
  final String state;
  final String postcode;
  final String country;
  final String countryCode;

  AddressDetails({
    required this.houseNumber,
    required this.road,
    required this.neighbourhood,
    required this.hamlet,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.countryCode,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) => AddressDetails(
    houseNumber: json["house_number"]??'',
    road: json["road"]??'',
    neighbourhood: json["neighbourhood"]??'',
    hamlet: json["hamlet"]??'',
    city: json["city"]??'',
    state: json["state"]??'',
    postcode: json["postcode"]??'',
    country: json["country"]??'',
    countryCode: json["country_code"]??'',
  );
}
