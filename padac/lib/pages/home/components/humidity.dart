import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/crop_controller.dart';
import '../../../utils/constants.dart';

class Humidity extends StatelessWidget {
  const Humidity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CropController cropController = Get.put(CropController());
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 2.h),
                child: Text(
                  'Humidity',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.jockeyOne(
                      fontSize: 16.sp, color: kPrimaryColor),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 4.h),
              child: Text(
                'units',
                textAlign: TextAlign.start,
                style: GoogleFonts.jockeyOne(
                    fontSize: 16.sp, color: kPrimaryColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Container(
          height: 40.h,
          width: 90.w,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: LineChart(
              LineChartData(
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(cropController.humidity.value.length,
                          (index) {
                        return FlSpot(
                            index.toDouble(),
                            double.parse(cropController.humidity.value[index]
                                .toString()));
                      }),
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.orange,
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
