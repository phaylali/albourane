import 'package:admin/edit/boat_edit.dart';
import 'package:admin/edit/declaration_edit.dart';
import 'package:admin/edit/marin_edit.dart';
import 'package:admin/forms/article_new.dart';
import 'package:admin/forms/boat_new.dart';
import 'package:admin/forms/declaration_new.dart';
import 'package:admin/forms/marin_new.dart';
import 'package:admin/lists/articles.dart';
import 'package:admin/lists/marins.dart';
import 'package:admin/pages/article_page.dart';
import 'package:admin/pages/home.dart';
import 'package:admin/pages/settings.dart';
import 'package:admin/resources/bindings.dart';
import 'package:admin/resources/error404.dart';
import 'package:admin/lists/boats.dart';
import 'package:admin/pages/boat_page.dart';
import 'package:admin/pages/declaration_page.dart';
import 'package:admin/pages/marin_page.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const home = _Paths.home;
  static const boats = _Paths.boats;
  static const boat = _Paths.boat;
  static const boatNew = _Paths.boatNew;
  static const boatEdit = _Paths.boatEdit;
  static const marinEdit = _Paths.marinEdit;
  static const marinNew = _Paths.marinNew;
  static const seamen = _Paths.seamen;
  static const seaman = _Paths.seaman;
  static const declaration = _Paths.declaration;
  static const declarationEdit = _Paths.declarationEdit;
  static const unknown = _Paths.unknown;
  static const declarationNew = _Paths.declarationNew;
  static const article = _Paths.article;
  static const articleNew = _Paths.articleNew;
  static const articles = _Paths.articles;
  static const settings = _Paths.settings;
}

abstract class _Paths {
  static const home = '/';
  static const boats = '/Boats';
  static const boat = '/Boat';
  static const boatNew = '/NewBoat';
  static const marinNew = '/NewSeaman';
  static const seamen = '/Seamen';
  static const seaman = '/Seaman';
  static const declaration = '/Declaration';
  static const unknown = '/Error404';
  static const declarationNew = '/NewDeclaration';
  static const articleNew = '/NewArticle';
  static const articles = '/News';
  static const article = '/Article';
  static const boatEdit = '/BoatEdit';
  static const marinEdit = '/MarinEdit';
  static const declarationEdit = '/DeclarationEdit';
  static const settings = '/Settings';
}

class AppPages {
  static const initial = Routes.home;
  static const unknown = Routes.unknown;
  static final routes = [
    GetPage(
        name: _Paths.home,
        page: () => HomePage(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: _Paths.settings,
            page: () => const Settings(),
            binding: HomeBinding(),
          ),
          GetPage(
              name: _Paths.boats,
              page: () => const Boats(),
              binding: BoatsBinding(),
              children: [
                GetPage(
                    name: _Paths.boat,
                    page: () => BoatPage(),
                    binding: BoatBinding()),
                GetPage(
                    name: _Paths.boatNew,
                    page: () => const BoatInput(),
                    binding: BoatInputBinding()),
                GetPage(
                    name: _Paths.boatEdit,
                    page: () => BoatEdit(),
                    binding: BoatEditBinding()),
              ]),
          GetPage(
              name: _Paths.seamen,
              page: () => const Marins(),
              binding: MarinsBinding(),
              children: [
                GetPage(
                    name: _Paths.marinNew,
                    page: () => const MarinInput(),
                    binding: MarinInputBinding()),
                GetPage(
                    name: _Paths.marinEdit,
                    page: () => MarinEdit(),
                    binding: MarinEditBinding()),
                GetPage(
                    name: _Paths.seaman,
                    page: () => MarinPage(),
                    binding: MarinBinding()),
              ]),
        ]),
    GetPage(
      name: _Paths.articles,
      page: () => const Articles(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: _Paths.article,
      page: () => ArticlePage(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.declaration,
      page: () => const DeclarationPage(),
      binding: DeclarationBinding(),
    ),
    GetPage(
      name: _Paths.unknown,
      page: () => const ERROR404(),
    ),
    GetPage(
        name: _Paths.declarationNew,
        page: () => DeclarationInput(),
        binding: DeclarationInputBinding()),
    GetPage(
        name: _Paths.articleNew,
        page: () => const ArticleInput(),
        binding: ArticleInputBinding()),
    GetPage(
        name: _Paths.declarationEdit,
        page: () => DeclarationEdit(),
        binding: DeclarationEditBinding()),
  ];
}
