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
  Future<dynamic> getValues() async {
    // final CropController cropController = Get.put(CropController());
    //await cropController.getChartData();
    await Future.delayed(Duration(seconds: 1), () {
      return {
        "P": List.generate(10, (index) {
          return FlSpot(index.toDouble(), index * Random().nextDouble());
        }),

        // This will be used to draw the orange line
        "N": List.generate(10, (index) {
          return FlSpot(index.toDouble(), index * Random().nextDouble());
        }),

        // This will be used to draw the blue line
        "K": List.generate(10, (index) {
          return FlSpot(index.toDouble(), index * Random().nextDouble());
        })
      };
    });
    // log(cropController.pnk.value.length);
    // return Future.value({
    //   "P": List.generate(10, (index) {
    //     return FlSpot(index.toDouble(), index * Random().nextDouble());
    //   }),

    //   // This will be used to draw the orange line
    //   "N": List.generate(10, (index) {
    //     return FlSpot(index.toDouble(), index * Random().nextDouble());
    //   }),

    //   // This will be used to draw the blue line
    //   "K": List.generate(10, (index) {
    //     return FlSpot(index.toDouble(), index * Random().nextDouble());
    //   })
    // });
  }

  @override
  Widget build(BuildContext context) {
    final CropController cropController = Get.put(CropController());
    // cropController.getChartData();

    // final List<FlSpot> dummyData1 = List.generate(10, (index) {
    //   return FlSpot(index.toDouble(), index * Random().nextDouble());
    // });

    // // This will be used to draw the orange line
    // final List<FlSpot> dummyData2 = List.generate(10, (index) {
    //   return FlSpot(index.toDouble(), index * Random().nextDouble());
    // });

    // // This will be used to draw the blue line
    // final List<FlSpot> dummyData3 = List.generate(10, (index) {
    //   return FlSpot(index.toDouble(), index * Random().nextDouble());
    // });

    return FutureBuilder(
      future: cropController.getChartData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Column(
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
                            spots: (snapshot.data as dynamic)['K'],
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.red,
                          ),
                          // The orange line
                          LineChartBarData(
                            spots: (snapshot.data as dynamic)['N'],
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.orange,
                          ),
                          // The blue line
                          LineChartBarData(
                            spots: (snapshot.data as dynamic)['P'],
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
          );
        }
        return Center(
          child: Container(child: Text("Error")),
        );
      },
    );
  }
}
