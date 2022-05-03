import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class BottomBtn extends StatelessWidget {
  final String text;
  final IconData icon;
  const BottomBtn({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kSecondaryColor.withAlpha(255),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 2.w),
          Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 8.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
