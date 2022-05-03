import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

class LogoDesc extends StatelessWidget {
  const LogoDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 80.w,
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
        ),
      ],
    );
  }
}
