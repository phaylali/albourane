import 'package:admin/adminsignin.dart';
import 'package:admin/auth.dart';
import 'package:admin/docs.dart';
import 'package:admin/documentPage.dart';
import 'package:admin/error404.dart';
import 'package:admin/home.dart';
import 'package:admin/newdoc.dart';
import 'package:admin/profile.dart';
import 'package:admin/themes.dart';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          GetPage(
              name: '/NewDocument',
              page: () => NewDocument(
                    title: 'New Document',
                    subtitle: 'something',
                  )),
          GetPage(
              name: '/Documents',
              page: () => DocsLibrary(
                    title: 'ALBOURANE ADMIN',
                    subtitle: 'Control Center',
                  )),
          GetPage(name: '/Profile', page: () => Profile()),
          GetPage(name: '/Document', page: () => DocumentPage()),
        ],
        unknownRoute: GetPage(name: '/Error404', page: () => ERROR404()),
        theme: omniLightBlueTheme(),
        darkTheme: omniDarkBlueTheme(),
        navigatorKey: Get.key,
        themeMode: ThemeMode.system,
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
