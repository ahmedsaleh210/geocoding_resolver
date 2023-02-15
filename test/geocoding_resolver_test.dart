import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding_resolver/src/geocoder.dart';

void main() {
  GeoCoder geoCoder = GeoCoder();
  group('GeoCoder Resolver', ()
  {
    test('getAddressFromLatLng returns the correct address',
            () async {
          try {
            final address = await geoCoder.getAddressFromLatLng(
                latitude: 40.20999, longitude: -6.79485);
            expect(address, isNotNull);
            expect(address.addressDetails, isNotNull);
          } catch (e) {
            expect(e, isNull);
          }
        });
    test('getAddressSuggestions returns the correct suggestions',
            () async {
          try {
            const text = 'المنصورة - مصر';
            final suggestions  = await geoCoder.getAddressSuggestions(
                address: text);
            expect(suggestions, isNotNull);
            expect(suggestions, isNotEmpty);
            expect(suggestions.map((e) => e.longitude), isNotNull);
          } catch (e) {
            expect(e, isNull);
          }
        });
  });

}
