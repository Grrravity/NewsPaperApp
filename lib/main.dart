import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_client.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_interceptor.dart';

import 'Core/Constants/ui_constants.dart';
import 'Core/Router/navigate.dart';
import 'Core/Router/routes.dart';

void main() async {
  await initializeServices();
  await initializeDateFormatting('fr_FR', null);
  runApp(const MyApp());
}

Future<void> initializeServices() async {
  ///Initialize API Client to get it in the bindings that requires it
  Get.put(
    RestApiClient(
      restApiInterceptor: Get.put(
        RestApiInterceptor(),
      ),
    ),
    permanent: true,
  );

  ///Put a default category in user's cookies to use it as default in API requests
  Get.put<Category>(Category.business, permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App NewsPaper',
      unknownRoute: Navigate.notFound,
      initialRoute: Routes.initialRoute,
      getPages: Navigate.routes,
      defaultTransition: Transition.fadeIn,
    );
  }
}
