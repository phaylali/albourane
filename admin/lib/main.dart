import 'package:admin/controllers/boats_controller.dart';
import 'package:admin/controllers/home_controller.dart';
import 'package:admin/controllers/marins_controller.dart';
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
      debugPrint("Firebase is not supported on Linux yet. Skipping initialization.");
    }
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
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
      const SystemUiOverlayStyle(statusBarColor: Colors.black));

  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        unknownRoute: AppPages.routes.firstWhere(
          (page) => page.name == AppPages.unknown,
          orElse: () => AppPages.routes.first,
        ),
        theme: omniDarkBlueTheme(),
        darkTheme: omniDarkBlueTheme(),
        navigatorKey: Get.key,
        title: "ALBOURANE",
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
