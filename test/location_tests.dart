import 'package:test/test.dart';
import 'package:weatherapp/models/location.dart';


void main(){
  test("testing location toString", testToString);
  // Creating a Location object from a json (toJson() function)
  test("testing toJson", testToJson);
  // Getting json data from a Location object (fromJson() function)
  test("testing fromJson", testFromJson);
  // Comparing two locations for equality (use an equal example which returns True, and an unequal example which returns false)

}

void testToJson() {
  Location location = getMockLocations();
  Map<String, dynamic> json = 
    {
      "state": "Oregon",
      "city": "Bend",
      "zip": "97703",
      "latitude": 44.0,
      "longitude": 121.0,
      "url": "http://www.example.com"
    };
  
  Map<String, dynamic> locationJson = location.toJson();
  expect(locationJson, json);
  
}

void testFromJson() {
  Location location = getMockLocations();
  Map<String, dynamic> json = 
    {
      "state": "Oregon",
      "city": "Bend",
      "zip": "97703",
      "latitude": 44.0,
      "longitude": 121.0,
      "url": "http://www.example.com"
    };

    Location locationFromJson = Location.fromJson(json);

    //Location:<city: Bend, Oregon, 97703, lat: 44.0, lon: 121.0>
    expect(location, locationFromJson);

}

void testToString(){
  Location location = getMockLocations();
  String locationString = location.toString();
  expect(locationString, "city: Bend, Oregon, 97703, lat: 44.0, lon: 121.0");
}




Location getMockLocations() {
  return Location (
    state: "Oregon",
    city: "Bend",
    zip: "97703",
    latitude: 44.0,
    longitude: 121.0,
    url: "http://www.example.com"
  );

  // String toString() {
  //   return "city: $city, $state, $zip, lat: $latitude, lon: $longitude";
  // }

}
