import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/homeController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:admin/pages/home.dart';
import 'package:admin/resources/routes.dart';
import 'package:admin/resources/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  initializeDateFormatting();

  try {
    if (kIsWeb || (defaultTargetPlatform != TargetPlatform.linux)) {
      await Firebase.initializeApp();
    } else {
      print("Firebase is not supported on Linux yet. Skipping initialization.");
    }
  } catch (e) {
    print("Firebase initialization failed: $e");
  }
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => MarinsController());
  Get.lazyPut(() => BoatsController());

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
        darkTheme: omniDarkBlueTheme(),
        navigatorKey: Get.key,
        title: "ALBOURANE",
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
