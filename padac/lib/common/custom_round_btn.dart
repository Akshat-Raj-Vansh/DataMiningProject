import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.width,
    required this.height,
    required this.color,
    required this.op,
  });
  final String text;
  final VoidCallback press;
  final double width;
  final double height;
  final Color color;
  final int op;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: color.withAlpha(op),
        onPressed: press,
        child: Text(
          text,
          style: GoogleFonts.jockeyOne(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
