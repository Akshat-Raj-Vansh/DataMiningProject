import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padac/composition_root.dart';
import 'package:padac/utils/constants.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CompositionRoot.configure();
  var startPage = await CompositionRoot.start();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp(startPage));
}

class MyApp extends StatelessWidget {
  final Widget startPage;

  const MyApp(this.startPage);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'PANDA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.jockeyOneTextTheme(Theme.of(context).textTheme),
            accentColor: kSecondaryColor,
            primaryColor: kPrimaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: startPage,
      ),
    );
  }
}
