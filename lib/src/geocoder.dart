import 'models/models.dart';
import 'service/network_service.dart';

class GeoCoder {
  static final _instance = GeoCoder._internal();

  GeoCoder._internal();

  factory GeoCoder() => _instance;
  final _service = NetworkService();
  Future<Address> getAddressFromLatLng(
      {required double latitude,
      required double longitude,
      Locale? lang}) async {
    try {
      final address = await _service.getAddressFromLatLng(
          lat: latitude, lng: longitude, lang: lang ?? Locale.en);
      return address;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LookupAddress>> getAddressSuggestions(
      {required address, Locale? lang}) {
    try {
      final addresses = _service.getAddressSuggestions(
          text: address, lang: lang ?? Locale.en);
      return addresses;
    } catch (e) {
      rethrow;
    }
  }
}
