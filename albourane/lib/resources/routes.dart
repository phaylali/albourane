import 'package:albourane/pages/home.dart';
import 'package:albourane/resources/error404.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const UNKNOWN = _Paths.UNKNOWN;
}

abstract class _Paths {
  static const HOME = '/';

  static const UNKNOWN = '/Error404';
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
      name: _Paths.UNKNOWN,
      page: () => ERROR404(),
    ),
  ];
}
