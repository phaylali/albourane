import 'package:admin/adminsignin.dart';
import 'package:admin/auth.dart';
import 'package:admin/boatController.dart';
import 'package:admin/boatpage.dart';
import 'package:admin/boats.dart';
import 'package:admin/docs.dart';
import 'package:admin/documentPage.dart';
import 'package:admin/error404.dart';
import 'package:admin/home.dart';
import 'package:admin/newboat.dart';
import 'package:admin/newdoc.dart';
import 'package:admin/newseaman.dart';
import 'package:admin/profile.dart';
import 'package:admin/seamanPage.dart';
import 'package:admin/seamen.dart';
import 'package:admin/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put(BoatsController);
  await Firebase.initializeApp();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AuthBinding(),
        getPages: [
          GetPage(name: '/', page: () => Root()),
          GetPage(name: '/SignIn', page: () => AdminSignIn()),
          GetPage(name: '/NewDocument', page: () => NewDocument()),
          GetPage(name: '/NewBoat', page: () => NewBoat()),
          GetPage(name: '/NewSeaman', page: () => NewSeaman()),
          GetPage(name: '/Documents', page: () => DocsLibrary()),
          GetPage(name: '/Boats', page: () => BoatsLibrary()),
          GetPage(name: '/Seamen', page: () => SeamenLibrary()),
          GetPage(name: '/Profile', page: () => Profile()),
          GetPage(name: '/Document', page: () => DocumentPage()),
          GetPage(name: '/Boat', page: () => BoatPage()),
          GetPage(name: '/Seaman', page: () => SeamanPage()),
        ],
        unknownRoute: GetPage(name: '/Error404', page: () => ERROR404()),
        //theme: omniLightBlueTheme(),

        theme: omniDarkBlueTheme(),
        navigatorKey: Get.key,
        //themeMode: ThemeMode.system,
        title: "ALBOURANE ADMIN",
        debugShowCheckedModeBanner: false,
        home: Root());
  }
}

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
        Get.put<AuthController>(AuthController());
        Database().getCurrentUser();
      },
      builder: (_) {
        return (Get.find<AuthController>().user != null)
            ? HomePage()
            : AdminSignIn();
      },
    );
  }
}
