import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "86".tr,
      titleStyle: TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "87".tr,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: Text("88".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: Text("89".tr))
      ]);
  return Future.value(true);
}
