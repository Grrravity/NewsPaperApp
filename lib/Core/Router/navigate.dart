import 'package:get/get.dart';
import 'package:newspaperapp/Core/Router/routes.dart';

import '../../main.dart';

class Navigate {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.home, page: () => const MyHomePage(title: 'NewsPaperApp')),
    GetPage(
        name: Routes.notFound,
        page: () => const MyHomePage(title: 'NewsPaperApp')),
    GetPage(
        name: Routes.article,
        page: () => const MyHomePage(title: 'NewsPaperApp')),
  ];
  static GetPage notFound = GetPage(
      name: Routes.home, page: () => const MyHomePage(title: 'NewsPaperApp'));
}
