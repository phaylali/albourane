import 'package:admin/edit/boatEdit.dart';
import 'package:admin/edit/declarationEdit.dart';
import 'package:admin/edit/marinEdit.dart';
import 'package:admin/forms/articleNew.dart';
import 'package:admin/forms/boatNew.dart';
import 'package:admin/forms/declarationNew.dart';
import 'package:admin/forms/marinNew.dart';
import 'package:admin/lists/articles.dart';
import 'package:admin/lists/marins.dart';
import 'package:admin/pages/articlePage.dart';
import 'package:admin/pages/home.dart';
import 'package:admin/pages/settings.dart';
import 'package:admin/resources/bindings.dart';
import 'package:admin/resources/error404.dart';
import 'package:admin/lists/boats.dart';
import 'package:admin/pages/boatPage.dart';
import 'package:admin/pages/declarationPage.dart';
import 'package:admin/pages/marinPage.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const BOATS = _Paths.BOATS;
  static const BOAT = _Paths.BOAT;
  static const BOATNEW = _Paths.BOATNEW;
  static const BOATEDIT = _Paths.BOATEDIT;
  static const MARINEDIT = _Paths.MARINEDIT;
  static const MARINNEW = _Paths.MARINNEW;
  static const SEAMEN = _Paths.SEAMEN;
  static const SEAMAN = _Paths.SEAMAN;
  static const DECLARATION = _Paths.DECLARATION;
  static const DECLARATIONEDIT = _Paths.DECLARATIONEDIT;
  static const UNKNOWN = _Paths.UNKNOWN;
  static const DECLARATIONNEW = _Paths.DECLARATIONNEW;
  static const ARTICLE = _Paths.ARTICLE;
  static const ARTICLENEW = _Paths.ARTICLENEW;
  static const ARTICLES = _Paths.ARTICLES;
  static const SETTINGS = _Paths.SETTINGS;
}

abstract class _Paths {
  static const HOME = '/';
  static const BOATS = '/Boats';
  static const BOAT = '/Boat';
  static const BOATNEW = '/NewBoat';
  static const MARINNEW = '/NewSeaman';
  static const SEAMEN = '/Seamen';
  static const SEAMAN = '/Seaman';
  static const DECLARATION = '/Declaration';
  static const UNKNOWN = '/Error404';
  static const DECLARATIONNEW = '/NewDeclaration';
  static const ARTICLENEW = '/NewArticle';
  static const ARTICLES = '/News';
  static const ARTICLE = '/Article';
  static const BOATEDIT = '/BoatEdit';
  static const MARINEDIT = '/MarinEdit';
  static const DECLARATIONEDIT = '/DeclarationEdit';
  static const SETTINGS = '/Settings';
}

class AppPages {
  static const INITIAL = Routes.HOME;
  static const UNKNOWN = Routes.UNKNOWN;
  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomePage(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: _Paths.SETTINGS,
            page: () => Settings(),
            binding: HomeBinding(),
          ),
          GetPage(
              name: _Paths.BOATS,
              page: () => Boats(),
              binding: BoatsBinding(),
              children: [
                GetPage(
                    name: _Paths.BOAT,
                    page: () => BoatPage(),
                    binding: BoatBinding()),
                GetPage(
                    name: _Paths.BOATNEW,
                    page: () => BoatInput(),
                    binding: BoatInputBinding()),
                GetPage(
                    name: _Paths.BOATEDIT,
                    page: () => BoatEdit(),
                    binding: BoatEditBinding()),
              ]),
          GetPage(
              name: _Paths.SEAMEN,
              page: () => Marins(),
              binding: MarinsBinding(),
              children: [
                GetPage(
                    name: _Paths.MARINNEW,
                    page: () => MarinInput(),
                    binding: MarinInputBinding()),
                GetPage(
                    name: _Paths.MARINEDIT,
                    page: () => MarinEdit(),
                    binding: MarinEditBinding()),
                GetPage(
                    name: _Paths.SEAMAN,
                    page: () => MarinPage(),
                    binding: MarinBinding()),
              ]),
        ]),
    GetPage(
      name: _Paths.ARTICLES,
      page: () => Articles(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticlePage(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.DECLARATION,
      page: () => DeclarationPage(),
      binding: DeclarationBinding(),
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
        name: _Paths.ARTICLENEW,
        page: () => ArticleInput(),
        binding: ArticleInputBinding()),
    GetPage(
        name: _Paths.DECLARATIONEDIT,
        page: () => DeclarationEdit(),
        binding: DeclarationEditBinding()),
  ];
}
