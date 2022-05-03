import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../controllers/crop_controller.dart';
import '../../../utils/constants.dart';

class SoilContent extends StatelessWidget {
  const SoilContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CropController cropController = Get.put(CropController());

    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Text(
                    'Soil Content',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.jockeyOne(
                        fontSize: 16.sp, color: kPrimaryColor),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 4.h),
                child: Row(
                  children: [
                    Text(
                      'P',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.jockeyOne(
                          fontSize: 16.sp, color: Colors.red),
                    ),
                    Text(
                      ', ',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.jockeyOne(
                          fontSize: 16.sp, color: kPrimaryColor),
                    ),
                    Text(
                      'N',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.jockeyOne(
                          fontSize: 16.sp, color: Colors.orange),
                    ),
                    Text(
                      ', ',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.jockeyOne(
                          fontSize: 16.sp, color: kPrimaryColor),
                    ),
                    Text(
                      'K',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.jockeyOne(
                          fontSize: 16.sp, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
            height: 30.h,
            width: 80.w,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: kLPrimaryColor, width: 2)),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      // The red line
                      LineChartBarData(
                        spots: List.generate(cropController.pnk.value[0].length,
                            (index) {
                          return FlSpot(
                              index.toDouble(),
                              double.parse(cropController.pnk.value[0][index]
                                  .toString()));
                        }),
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.red,
                      ),
                      // The orange line
                      LineChartBarData(
                        spots: List.generate(cropController.pnk.value[1].length,
                            (index) {
                          return FlSpot(
                              index.toDouble(),
                              double.parse(cropController.pnk.value[1][index]
                                  .toString()));
                        }),
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.orange,
                      ),
                      // The blue line
                      LineChartBarData(
                        spots: List.generate(cropController.pnk.value[2].length,
                            (index) {
                          return FlSpot(
                              index.toDouble(),
                              double.parse(cropController.pnk.value[2][index]
                                  .toString()));
                        }),
                        isCurved: false,
                        barWidth: 3,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
