import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/common/custom_round_btn.dart';
import 'package:padac/pages/home/components/appbar.dart';
import 'package:padac/pages/home/components/dashboard_btn.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

import 'components/bottom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final dashboard = [
  'Summary',
  'Soil Content',
  'pH',
  'Rainfall',
  'Temperature',
  'Humidity'
];

class _HomeScreenState extends State<HomeScreen> {
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
                        itemBuilder: (ctx, index) => DashBoardBtn(
                              height: 4.h,
                              op: 255,
                              color: kSecondaryColor,
                              text: dashboard[index],
                              press: () {},
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
                            'Weather forecast',
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
                  Container(
                    height: 100,
                    width: 80.w,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: kLPrimaryColor, width: 2)),
                    child: Center(
                      child: Text(
                        'Today, 12th July 2020',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.sp, color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Text(
                            'Current tasks',
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
                  Container(
                    height: 60.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) => Container(
                        height: 70,
                        width: 70.w,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 4.h, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: kLPrimaryColor, width: 2)),
                        child: Center(
                          child: Text(
                            'Task ${index + 1}',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 8.h,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: kLightBGColor,
                border: Border.all(color: kLPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomBtn(
                    text: 'Home',
                    icon: Icons.home_outlined,
                  ),
                  const Icon(
                    Icons.location_city_outlined,
                    color: kSecondaryColor,
                  ),
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: kSecondaryColor,
                  ),
                  const Icon(
                    Icons.task_alt_outlined,
                    color: kSecondaryColor,
                  ),
                  const Icon(
                    Icons.more_horiz_outlined,
                    color: kSecondaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
