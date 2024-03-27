import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
   const CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:  TextStyle(color: AppColor.primaryColor,fontSize: 30, fontWeight: FontWeight.bold)
    );
  }
}
