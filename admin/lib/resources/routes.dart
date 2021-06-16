import 'package:admin/forms/boatNew.dart';
import 'package:admin/forms/declarationNew.dart';
import 'package:admin/resources/bindings.dart';
import 'package:admin/resources/error404.dart';
import 'package:admin/home.dart';
import 'package:admin/lists/boats.dart';
import 'package:admin/lists/marins.dart';
import 'package:admin/login.dart';
import 'package:admin/pages/boatPage.dart';
import 'package:admin/pages/declarationPage.dart';
import 'package:admin/pages/marinPage.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const BOATS = _Paths.BOATS;
  static const BOAT = _Paths.BOAT;
  static const BOATNEW = _Paths.BOATNEW;
  static const SEAMEN = _Paths.SEAMEN;
  static const SEAMAN = _Paths.SEAMAN;
  static const DECLARATION = _Paths.DECLARATION;
  static const UNKNOWN = _Paths.UNKNOWN;
  static const DECLARATIONNEW = _Paths.DECLARATIONNEW;
}

abstract class _Paths {
  static const HOME = '/';
  static const LOGIN = '/SignIn';
  static const BOATS = '/Boats';
  static const BOAT = '/Boat';
  static const BOATNEW = '/NewBoat';
  static const SEAMEN = '/Seamen';
  static const SEAMAN = '/Seaman';
  static const DECLARATION = '/Declaration';
  static const UNKNOWN = '/Error404';
  static const DECLARATIONNEW = '/NewDeclaration';
}

class AppPages {
  static const INITIAL = Routes.HOME;
  static const UNKNOWN = Routes.UNKNOWN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => AdminSignIn(),
    ),
    GetPage(
      name: _Paths.BOATS,
      page: () => Boats(),
    ),
    GetPage(
      name: _Paths.BOAT,
      page: () => BoatPage(),
    ),
    GetPage(
      name: _Paths.SEAMEN,
      page: () => Marins(),
    ),
    GetPage(
      name: _Paths.SEAMAN,
      page: () => MarinPage(),
    ),
    GetPage(
      name: _Paths.DECLARATION,
      page: () => DeclarationPage(),
    ),
    GetPage(
      name: _Paths.UNKNOWN,
      page: () => ERROR404(),
    ),
    GetPage(
        name: _Paths.DECLARATIONNEW,
        page: () => DeclarationInput(),
        binding: DeclarationInputBinding()),
    GetPage(
        name: _Paths.BOATNEW,
        page: () => BoatInput(),
        binding: BoatInputBinding()),
  ];
}
