import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active   ;
   const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true ? AppColor.primaryColor : AppColor.grey2),
      ]),
    );
  }
}
