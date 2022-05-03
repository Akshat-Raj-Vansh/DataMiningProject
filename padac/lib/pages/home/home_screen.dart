import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/common/custom_round_btn.dart';
import 'package:padac/controllers/crop_controller.dart';
import 'package:padac/pages/home/components/appbar.dart';
import 'package:padac/pages/home/components/dashboard_btn.dart';
import 'package:padac/pages/home/components/humidity.dart';
import 'package:padac/pages/home/components/ph.dart';
import 'package:padac/pages/home/components/rainfall.dart';
import 'package:padac/pages/home/components/soil_content.dart';
import 'package:padac/pages/home/components/summary.dart';
import 'package:padac/pages/home/components/temperature.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

import 'components/bottom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CropController cropController = Get.put(CropController());
  final PageController pageController = PageController();

  final dashboard = [
    'Summary',
    'Soil Content',
    'pH',
    'Rainfall',
    'Temperature',
    'Humidity'
  ];

  var _selected = 0;

  @override
  void initState() {
    super.initState();
    cropController.getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: CustomAppBar(),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h + 40),
            child: SingleChildScrollView(
              //   physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Text(
                      'Dashboard',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.jockeyOne(
                          fontSize: 24.sp, color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.h),
                    height: 4.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => Obx(
                              () => DashBoardBtn(
                                height: 4.h,
                                op: 255,
                                color:
                                    cropController.selectedPage.value != index
                                        ? kPrimaryColor
                                        : kSecondaryColor,
                                text: dashboard[index],
                                press: () {
                                  cropController.changePage(index);
                                  pageController.jumpToPage(
                                    index,
                                  );
                                },
                              ),
                            ),
                        itemCount: dashboard.length),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Text(
                            'Predicted Crop',
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
                  SizedBox(height: 1.h),
                  Obx(
                    () => Container(
                      height: 20.h,
                      width: 80.w,
                      margin:
                          EdgeInsets.symmetric(horizontal: 2.h, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: kLPrimaryColor, width: 2)),
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              cropController.featureValue.isNotEmpty
                                  ? 'assets/crops/${cropController.featureValue[1]}.jpg'
                                  : 'assets/crops/apple.jpg',
                              width: 80.w,
                              height: 20.h,
                              fit: BoxFit.fitWidth,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                color: kSecondaryColor.withOpacity(0.5),
                                child: Text(
                                  cropController.featureValue.isNotEmpty
                                      ? cropController.featureValue[1]
                                          .toUpperCase()
                                      : 'Loading',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 80.h,
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        Summary(),
                        SoilContent(),
                        PH(),
                        Rainfall(),
                        Temperature(),
                        Humidity(),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 8.h,
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          //     decoration: BoxDecoration(
          //       color: kLightBGColor,
          //       border: Border.all(color: kLPrimaryColor, width: 2),
          //       borderRadius: BorderRadius.circular(40),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         BottomBtn(
          //           text: 'Home',
          //           icon: Icons.home_outlined,
          //         ),
          //         const Icon(
          //           Icons.location_city_outlined,
          //           color: kSecondaryColor,
          //         ),
          //         const Icon(
          //           Icons.calendar_month_outlined,
          //           color: kSecondaryColor,
          //         ),
          //         const Icon(
          //           Icons.task_alt_outlined,
          //           color: kSecondaryColor,
          //         ),
          //         const Icon(
          //           Icons.more_horiz_outlined,
          //           color: kSecondaryColor,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
