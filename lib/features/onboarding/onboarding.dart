import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/onboarding_controller.dart';
import 'widgets/custombutton.dart';
import 'widgets/customslider.dart';
import 'widgets/dotcontroller.dart';
class OnBoarding extends StatelessWidget {
   const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotControllerOnBoarding(),
                      Spacer(flex: 1),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ]),
      ),
    );
  }
}
