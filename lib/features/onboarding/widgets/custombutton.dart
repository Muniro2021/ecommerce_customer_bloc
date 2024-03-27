import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../controller/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
   const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(bottom: 30),
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, side:  BorderSide(color: AppColor.primaryColor),
            shape:  const CircleBorder(),
            padding:  const EdgeInsets.all(20)),
        // color: AppColor.primaryColor,
        child: Container(
          padding:  const EdgeInsets.all(20),
          decoration:
               BoxDecoration(color: AppColor.primaryColor, shape: BoxShape.circle),
          child:  const Icon(Icons.arrow_forward_ios,),
        ),
      ),
    );
  }
}
