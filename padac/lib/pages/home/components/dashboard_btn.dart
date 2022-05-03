import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashBoardBtn extends StatelessWidget {
  const DashBoardBtn({
    Key? key,
    required this.text,
    required this.press,
    required this.height,
    required this.color,
    required this.op,
  }) : super(key: key);
  final String text;
  final Function()? press;
  final double height;
  final Color color;
  final int op;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: color.withAlpha(op),
        onPressed: press,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 8.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
