import 'package:flutter/material.dart';
import 'package:padac/pages/splash/components/logo_desc.dart';
import 'package:padac/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBGColor,
      body: Center(child: LogoDesc()),
    );
  }
}
