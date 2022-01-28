import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';

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
      defaultTransition: Transition.fadeIn,
      unknownRoute: Navigate.notFound,
      initialRoute: Routes.initialRoute,
      getPages: Navigate.routes,
      debugShowCheckedModeBanner: false,
      title: 'NewsPaperApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NewsPaperApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Bienvenue dans',
              style: UiConstants.h3Bold,
            ),
            Text(
              'NewsPaperApp',
              style: UiConstants.h2Bold,
            ),
          ],
        ),
      ),
    );
  }
}
