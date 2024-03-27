import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth/login_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/validinput.dart';
import 'widgets/custombuttonauth.dart';
import 'widgets/customtextbodyauth.dart';
import 'widgets/customtextformauth.dart';
import 'widgets/customtexttitleauth.dart';
import 'widgets/logoauth.dart';
import 'widgets/textsignup.dart';

class Login extends StatelessWidget {
   const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          '9'.tr,
          style:  const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                       const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                       const SizedBox(height: 10),
                       const LogoAuth(),
                       const SizedBox(height: 5),
                      CustomTextTitleAuth(text: "10".tr),
                       const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "91".tr),
                       const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                        // mycontroller: ,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "13".tr,
                          iconData: Icons.fingerprint,
                          
                          labeltext: "19".tr,
                          // mycontroller: ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      CustomButtomAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      //  SizedBox(height: 20),
                      CustomTextSignUpOrSignIn(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
