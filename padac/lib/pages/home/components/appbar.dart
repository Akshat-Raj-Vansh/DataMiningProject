import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightBGColor,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5),
      margin: EdgeInsets.only(top: 30),
      height: 8.h,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset('assets/images/logo.png', height: 80.h),
          Expanded(
            child: Row(
              children: [
                Text(
                  'PAN',
                  style: GoogleFonts.jockeyOne(
                      fontSize: 32.sp, color: kSecondaryColor),
                ),
                Text(
                  "DA",
                  style: GoogleFonts.jockeyOne(
                      fontSize: 32.sp, color: kPrimaryColor),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.notification_add_outlined,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: 2.w,
          ),
          const Icon(
            Icons.handshake_outlined,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: 2.w,
          ),
          const Icon(
            Icons.person_outline,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
    );
  }
}
