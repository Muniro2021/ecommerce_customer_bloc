import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../controller/onboarding_controller.dart';
import '../data/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
   const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
           const SizedBox(height: 20),
          Text(
            onBoardingList[i].title!,
            style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: AppColor.primaryColor),
          ),
           const SizedBox(height: 10),
          Container(
            // padding:  EdgeInsets.all(20),
            decoration:  const BoxDecoration(color: Colors.white),
            child: Image.asset(
              onBoardingList[i].image!,
              height: Get.height / 2.5,
              fit: BoxFit.contain,
            ),
          ),
           const SizedBox(height: 10),
          Container(
            padding:  const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style:  const TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
