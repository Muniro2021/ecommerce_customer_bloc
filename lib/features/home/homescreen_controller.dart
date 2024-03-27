import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
     const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [Center(child: Text("notifications_on_outlined"))],
    ),
    //  Offers(),
    //  const Settings()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home_outlined},
    {"title": "notifications", "icon": Icons.notifications_on_outlined},
    // {"title": "offers", "icon": Icons.offline_bolt_outlined},
    // {"title": "settings", "icon": Icons.settings_outlined}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
