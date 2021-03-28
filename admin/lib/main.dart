import 'package:admin/checker.dart';
import 'package:admin/login.dart';
import 'package:admin/boatPage.dart';
import 'package:admin/boats.dart';
import 'package:admin/docs.dart';
import 'package:admin/docPage.dart';
import 'package:admin/error404.dart';
import 'package:admin/boatNew.dart';
import 'package:admin/docNew.dart';
import 'package:admin/seamanNew.dart';
import 'package:admin/seamanPage.dart';
import 'package:admin/seamen.dart';
import 'package:admin/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Firebase.initializeApp();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(ProviderScope(child: Start()));
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: GetMaterialApp(
        getPages: [
          GetPage(name: '/', page: () => Root()),
          GetPage(name: '/SignIn', page: () => AdminSignIn()),
          GetPage(name: '/NewDocument', page: () => NewDocument()),
          GetPage(name: '/NewBoat', page: () => NewBoat()),
          GetPage(name: '/NewSeaman', page: () => NewSeaman()),
          GetPage(name: '/Documents', page: () => DocsLibrary()),
          GetPage(name: '/Boats', page: () => BoatsLibrary()),
          GetPage(name: '/Seamen', page: () => SeamenLibrary()),
          GetPage(name: '/Document', page: () => DocumentPage()),
          GetPage(name: '/Boat', page: () => BoatPage()),
          GetPage(name: '/Seaman', page: () => SeamanPage()),
        ],
        unknownRoute: GetPage(name: '/Error404', page: () => ERROR404()),
        theme: omniDarkBlueTheme(),
        navigatorKey: Get.key,
        title: "ALBOURANE ADMIN",
        debugShowCheckedModeBanner: false,
        home: Root(),
      ),
    );
  }
}
