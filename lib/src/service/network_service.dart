import 'dart:convert';
import 'package:http/http.dart' as http;
import 'end_points.dart';
import '../models/models.dart';
import 'extensions.dart';
export 'extensions.dart';

class NetworkService {
  static const _baseURL = 'nominatim.openstreetmap.org';
  static const _jsonFormat = 'json';

  static Map<String, dynamic> _toQueryParams(
      {required double lat, required double lng}) {
    return {'lat': '$lat', 'lon': '$lng', 'format': _jsonFormat};
  }

  Future<Address> getAddressFromLatLng(
      {required double lat, required double lng, required Locale lang}) async {
    final uri =
        Uri.https(_baseURL, reverse, _toQueryParams(lat: lat, lng: lng));
    try {
      final response = await http.get(uri, headers: {'Accept-Language': lang.toLang()});
      if (response.statusCode != 200) {
        throw http.ClientException(
            'Error ${response.statusCode}: ${response.body}', uri);
      }
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse.containsKey('error')) {
        throw 'Error: ${jsonResponse.values.toString().removeParentheses()}';
      }
      final address = addressFromJson(response.body);
      return address;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LookupAddress>> getAddressSuggestions(
      {required String text, required Locale lang}) async {
    final uri = Uri.https(_baseURL, search, {'q': text, 'format': _jsonFormat});
    final response = await http.get(uri, headers: {'Accept-Language': lang.toLang()});
    if (response.statusCode != 200) {
      throw http.ClientException(
          'Error ${response.statusCode}: ${response.body}', uri);
    }
    final address = suggestionListFromJson(response);
    return address;
  }
}
