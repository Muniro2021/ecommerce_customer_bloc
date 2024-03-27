import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

requestPermissionLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Get.snackbar("location permission", "Please Enable Location");
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar(
          "location permission", "Please Enable Location Service For The App");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Get.snackbar("location permission",
        'Location permissions are permanently denied, we cannot request permissions.');
  }
}
