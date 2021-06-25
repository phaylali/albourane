import 'package:albourane/pages/home.dart';
import 'package:albourane/resources/routes.dart';
import 'package:albourane/resources/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  initializeDateFormatting();

  await Firebase.initializeApp();
  LicenseRegistry.addLicense(() async* {
    final licenseAR = await rootBundle.loadString('res/fonts/OFL.txt');
    final licenseEN = await rootBundle.loadString('res/fonts/SIL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], licenseAR);
    yield LicenseEntryWithLineBreaks(['fonts'], licenseEN);
  });
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        unknownRoute: AppPages.routes[7],
        theme: omniDarkBlueTheme(),
        navigatorKey: Get.key,
        title: "ALBOURANE",
        debugShowCheckedModeBanner: false,
        //uncomment this when the project is finished
        //home: Root(),
        //comment this when the debug is finished
        home: HomePage());
  }
}
