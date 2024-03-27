import 'package:get/get.dart';

import '../services/services.dart';

translateDatabase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else if (myServices.sharedPreferences.getString("lang") == "en") {
    return columnen;
  } else {
    return columnen;
  }
}
