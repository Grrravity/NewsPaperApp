import 'package:get/get.dart';
import 'package:newspaperapp/Controller/Home/home_controller_bindings.dart';
import 'package:newspaperapp/Core/Router/routes.dart';
import 'package:newspaperapp/Views/pages/home.dart';

class Navigate {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(title: 'NewsPaperApp'),
      binding: HomeControllerBindings(),
    ),
    GetPage(name: Routes.notFound, page: () => HomeView(title: 'NewsPaperApp')),
    GetPage(name: Routes.article, page: () => HomeView(title: 'NewsPaperApp')),
  ];
  static GetPage notFound =
      GetPage(name: Routes.home, page: () => HomeView(title: 'NewsPaperApp'));
}
