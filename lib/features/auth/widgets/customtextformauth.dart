import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

   const CustomTextFormAuth(
      {super.key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:  const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(30),
      ),
      margin:  const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            ?  const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          hintText: hinttext,
          hintStyle:  const TextStyle(fontSize: 14),
          contentPadding:
               const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(
                iconData,
                size: 30,
              )),
          suffixIconColor: AppColor.primaryColor,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
