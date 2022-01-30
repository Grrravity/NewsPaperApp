import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Core/Router/navigate.dart';
import 'Core/Router/routes.dart';

void main() async {
  await initializeDateFormatting('fr_FR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsPaperApp',
      unknownRoute: Navigate.notFound,
      initialRoute: Routes.initialRoute,
      getPages: Navigate.routes,
      defaultTransition: Transition.fadeIn,
    );
  }
}
