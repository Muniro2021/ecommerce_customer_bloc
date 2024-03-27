import 'package:get/get.dart';

import '../features/auth/forgetpassword/forgetpassword.dart';
import '../features/auth/forgetpassword/resetpassword.dart';
import '../features/auth/forgetpassword/success_resetpassword.dart';
import '../features/auth/forgetpassword/verifycode.dart';
import '../features/auth/login.dart';
import '../features/auth/signup.dart';
import '../features/auth/success_signup.dart';
import '../features/auth/verifycodesignup.dart';
import '../features/home/homescreen.dart';
import '../features/onboarding/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  //  OnBoarding && Auth
  GetPage(name: "/", page: () => const OnBoarding()),
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/signup", page: () => const SignUp()),
  GetPage(name: "/forgetpassword", page: () => const ForgetPassword()),
  GetPage(name: "/verfiycode", page: () => const VerfiyCode()),
  GetPage(name: "/resetpassword", page: () => const ResetPassword()),
  GetPage(name: "/successresetpassword", page: () => const SuccessResetPassword()),
  GetPage(name: "/successsignup", page: () => const SuccessSignUp()),
  GetPage(name: "/verfiycodesignup", page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: "/homepage", page: () => const HomeScreen()),
];
