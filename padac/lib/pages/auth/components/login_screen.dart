import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/adapters/auth_page_adapter.dart';
import 'package:padac/common/custom_round_btn.dart';
import 'package:padac/common/custom_text_field.dart';
import 'package:padac/controllers/auth_controller.dart';
import 'package:padac/pages/auth/components/logo_desc.dart';
import 'package:padac/pages/auth/components/register_screen.dart';
import 'package:padac/services/auth/auth_service.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  var _email = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBGColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const LogoDesc(),
            SizedBox(height: 2.h),
            Text(
              'LOGIN',
              style: GoogleFonts.jockeyOne(
                fontSize: 52.sp,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 2.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hint: "EMAIL",
                    icon: const Icon(Icons.person, color: kLPrimaryColor),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    color: kLPrimaryColor,
                    width: 80.w,
                    backgroundColor: kLightBGColor,
                    textAlign: TextAlign.center,
                    initialValue: "",
                    onChanged: (String? value) {},
                    onSubmitted: (String? value) {
                      _email = value!;
                    },
                    textInputAction: TextInputAction.next,
                    validator: (String? value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.') ||
                          !value.contains('com')) {
                        return 'Please enter a valid email';
                      }
                    },
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
                    onSubmitted: (String? value) {
                      _password = value!;
                    },
                    textInputAction: TextInputAction.done,
                    validator: (String? value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Invalid Password entered!';
                      }
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultButton(
                    height: 6.h,
                    width: 80.w,
                    text: "LOGIN",
                    press: () {
                      // Get.to(() => RegisterScreen(),
                      //     transition: Transition.rightToLeftWithFade);
                      final FormState form = _formKey.currentState!;
                      if (form.validate()) {
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text('Welcome $_email'),
                        // ));
                        authController.login(_email, _password);
                      }
                    },
                    op: 255,
                    color: kSecondaryColor,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Get.to(() => RegisterScreen(),
                //     transition: Transition.rightToLeftWithFade);
              },
              child: Center(
                child: Text(
                  'Don\'t have an account? Register here',
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
