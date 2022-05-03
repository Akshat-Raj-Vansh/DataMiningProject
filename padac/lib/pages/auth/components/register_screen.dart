import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/common/custom_round_btn.dart';
import 'package:padac/common/custom_text_field.dart';
import 'package:padac/pages/auth/components/logo_desc.dart';
import 'package:padac/pages/home/home_screen.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBGColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  'REGISTER',
                  style: GoogleFonts.jockeyOne(
                    fontSize: 52.sp,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            CustomTextFormField(
              hint: "USERNAME",
              icon: const Icon(Icons.person, color: kLPrimaryColor),
              obscureText: false,
              keyboardType: TextInputType.number,
              color: kLPrimaryColor,
              width: 80.w,
              backgroundColor: kLightBGColor,
              textAlign: TextAlign.center,
              initialValue: "",
              onChanged: (String? value) {},
              onSubmitted: (String? value) {},
              textInputAction: TextInputAction.next,
              validator: (String? value) {},
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              hint: "PASSWORD",
              icon: const Icon(Icons.lock, color: kLPrimaryColor),
              obscureText: true,
              keyboardType: TextInputType.text,
              color: kLPrimaryColor,
              width: 80.w,
              backgroundColor: kLightBGColor,
              textAlign: TextAlign.center,
              initialValue: "",
              onChanged: (String? value) {},
              onSubmitted: (String? value) {},
              textInputAction: TextInputAction.next,
              validator: (String? value) {},
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              hint: "PASSWORD",
              icon: const Icon(Icons.lock, color: kLPrimaryColor),
              obscureText: true,
              keyboardType: TextInputType.text,
              color: kLPrimaryColor,
              width: 80.w,
              backgroundColor: kLightBGColor,
              textAlign: TextAlign.center,
              initialValue: "",
              onChanged: (String? value) {},
              onSubmitted: (String? value) {},
              textInputAction: TextInputAction.next,
              validator: (String? value) {},
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              hint: "DISTRICT",
              icon: const Icon(Icons.map_outlined, color: kLPrimaryColor),
              obscureText: true,
              keyboardType: TextInputType.text,
              color: kLPrimaryColor,
              width: 80.w,
              backgroundColor: kLightBGColor,
              textAlign: TextAlign.center,
              initialValue: "",
              onChanged: (String? value) {},
              onSubmitted: (String? value) {},
              textInputAction: TextInputAction.next,
              validator: (String? value) {},
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              hint: "CITY",
              icon: const Icon(Icons.map_outlined, color: kLPrimaryColor),
              obscureText: true,
              keyboardType: TextInputType.text,
              color: kLPrimaryColor,
              width: 80.w,
              backgroundColor: kLightBGColor,
              textAlign: TextAlign.center,
              initialValue: "",
              onChanged: (String? value) {},
              onSubmitted: (String? value) {},
              textInputAction: TextInputAction.next,
              validator: (String? value) {},
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              hint: "STATE",
              icon: const Icon(Icons.map_outlined, color: kLPrimaryColor),
              obscureText: true,
              keyboardType: TextInputType.text,
              color: kLPrimaryColor,
              width: 80.w,
              backgroundColor: kLightBGColor,
              textAlign: TextAlign.center,
              initialValue: "",
              onChanged: (String? value) {},
              onSubmitted: (String? value) {},
              textInputAction: TextInputAction.done,
              validator: (String? value) {},
            ),
            SizedBox(
              height: 5.h,
            ),
            DefaultButton(
              height: 6.h,
              width: 80.w,
              text: "REGISTER",
              op: 255,
              color: kSecondaryColor,
              press: () {
                //   Get.to(() => HomeScreen(), transition: Transition.leftToRight);
              },
            ),
            SizedBox(height: 1.h),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Center(
                child: Text(
                  'Already have an account?Login here',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: kSecondaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
