import 'package:flutter/material.dart';

import '../../../core/constant/imgaeasset.dart';

class LogoAuth extends StatelessWidget {
   const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 100,
        backgroundColor: Colors.white,
        child: Padding(
          padding:  const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.logo,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
