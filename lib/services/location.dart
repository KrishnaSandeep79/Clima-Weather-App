import 'package:geolocator/geolocator.dart';

class Location {

  double lat;
  double long;

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
    }
    catch(e) {
      print(e);
    }
  }


}