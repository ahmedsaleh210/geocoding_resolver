# GeoCoding Resolver
[![pub package](https://img.shields.io/pub/v/geocodeing_resolver.svg)](https://pub.dev/packages/geocoding_resolver)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![stars](https://img.shields.io/github/stars/ahmedsaleh210/geocoding_resolver)

Flutter Package that provides methods for converting between geographic coordinates and addresses.

## Features
* Reverse geocoding: The library provides methods to get the address of a given geographic coordinate.
* Address suggestions: The library provides methods to get address suggestions for a given address.
* Support for multiple languages: The methods accept an optional Locale parameter, which can be used to specify the language in which the address information should be retrieved. The default language is English. 
* Support for multiple address formats: The methods accept an optional AddressFormat parameter, which can be used to specify the address format in which the address information should be retrieved.

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  geocodeing_resolver: <lastest>
```
## Usage
The GeoCoder class is implemented as a singleton, with a factory constructor that returns the same instance of the class every time it is called.
```dart
GeoCoder geoCoder = GeoCoder();
```

### getAddressFromLatLng
```dart
Address address = await geoCoder.getAddressFromLatLng(
    latitude: 37.4219999,
    longitude: 32.0840575
);
```

### getAddressSuggestions
```dart
  List<LookupAddress> addresses =
    await geoLocationService.getAddressSuggestions(
  address: '1600 Amphitheatre Parkway, Mountain View, CA');
```
## Responses

Address is a class that represents an address and its details. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| placeId     | double | represents the unique identifier of the place. |
| latitude      | double | represents the latitude of the place. |
| longitude      | double    | represents the longitude of the place. |
| displayName  | String    | represents the display name of the place. |
| boundingBox | list of strings | represents the bounding box of the place |
| addressDetails      | String | An instance of the AddressDetails class that holds more detailed information about the address. |

AddressDetails is a class that represents the details of an address. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| houseNumber     | String | represents the house number of the address. |
| road      | String | represents the road of the address. |
| neighbourhood      | String    | represents the neighborhood of the address. |
| hamlet  | String    | represents the hamlet of the address. |
| city | String | represents the city of the address |
| state      | String | represents the state of the address. |
| postcode      | String | represents the postal code of the address. |
| country      | String | represents the country of the address. |
| countryCode      | String | represents the country code of the address. |

## Dependencies
```yaml
http: ^0.13.5
```

## Additional information
the library uses the following APIs:
* [OSM Geocoding API](https://nominatim.org/release-docs/latest/api/Overview/)