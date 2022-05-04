import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/crop_controller.dart';
import '../../../utils/constants.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         margin: EdgeInsets.symmetric(horizontal: 2.h),
        //         child: Text(
        //           'Weather forecast',
        //           textAlign: TextAlign.start,
        //           style: GoogleFonts.jockeyOne(
        //               fontSize: 16.sp, color: kPrimaryColor),
        //         ),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       margin: EdgeInsets.symmetric(horizontal: 2.h),
        //       child: const Icon(
        //         Icons.keyboard_arrow_right,
        //         color: kPrimaryColor,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 1.h),
        // Container(
        //   height: 100,
        //   width: 80.w,
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //   margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 10),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: Colors.white,
        //       border: Border.all(color: kLPrimaryColor, width: 2)),
        //   child: Center(
        //     child: Text(
        //       'Today, 12th July 2020',
        //       textAlign: TextAlign.start,
        //       style:
        //           GoogleFonts.montserrat(fontSize: 12.sp, color: kPrimaryColor),
        //     ),
        //   ),
        // ),
        SizedBox(height: 3.h),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 2.h),
                child: Text(
                  'Current values',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.jockeyOne(
                      fontSize: 16.sp, color: kPrimaryColor),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 2.h),
              child: const Icon(
                Icons.keyboard_arrow_right,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: GetX<CropController>(
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 3.h, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.featureName[index].toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 12.sp, color: kPrimaryColor),
                    ),
                    const Expanded(child: Text(":")),
                    Text(
                      controller.featureValue[index],
                      style: GoogleFonts.montserrat(
                          fontSize: 12.sp, color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
              itemCount: controller.featureValue.length,
            ),
          ),
        ),
        // Expanded(
        //   child: GetX<CropController>(
        //     builder: (controller) => ListView.builder(
        //       shrinkWrap: true,
        //       itemBuilder: (ctx, index) => Container(
        //         height: 70,
        //         width: 70.w,
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         margin: EdgeInsets.symmetric(horizontal: 4.h, vertical: 5),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.white,
        //             border: Border.all(color: kLPrimaryColor, width: 2)),
        //         child: Center(
        //           child: Text(
        //             controller.dashboard[index],
        //             textAlign: TextAlign.start,
        //             style: GoogleFonts.montserrat(
        //                 fontSize: 12.sp, color: kPrimaryColor),
        //           ),
        //         ),
        //       ),
        //       itemCount: controller.dashboard.length,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
