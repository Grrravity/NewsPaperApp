import 'package:get/get.dart';
import 'package:newspaperapp/Controller/Categories/categories_controller_bindings.dart';
import 'package:newspaperapp/Controller/Detail/detail_controller_bindings.dart';
import 'package:newspaperapp/Controller/Home/home_controller_bindings.dart';
import 'package:newspaperapp/Core/Router/routes.dart';
import 'package:newspaperapp/Views/Pages/categories.dart';
import 'package:newspaperapp/Views/Pages/detail.dart';
import 'package:newspaperapp/Views/pages/home.dart';

class Navigate {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeControllerBindings(),
    ),
    GetPage(
      name: Routes.article,
      page: () => DetailView(),
      binding: DetailControllerBindings(),
    ),
    GetPage(
        name: Routes.categories,
        page: () => CategoriesView(),
        binding: CategoriesControllerBindings()),
  ];
  static GetPage notFound = GetPage(name: Routes.home, page: () => HomeView());
}
