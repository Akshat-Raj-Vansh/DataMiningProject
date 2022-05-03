import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/pages/auth/components/login_screen.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

class LogoDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Get.off(() => LoginScreen(), transition: Transition.fadeIn));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PAN',
              style: GoogleFonts.jockeyOne(
                  fontSize: 52.sp, color: kSecondaryColor),
            ),
            Text(
              "DA",
              style:
                  GoogleFonts.jockeyOne(fontSize: 52.sp, color: kPrimaryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Predictive Analysis',
              style: GoogleFonts.jockeyOne(
                  fontSize: 12.sp, color: kSecondaryColor),
            ),
            Text(
              ' of Digital Agriculture',
              style:
                  GoogleFonts.jockeyOne(fontSize: 12.sp, color: kPrimaryColor),
            ),
          ],
        )
      ],
    );
  }
}
