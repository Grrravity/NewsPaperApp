import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';

import 'app_bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final bool isShowBottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  /// Scaffold personnalisé pour l'application mobile
  ///
  /// Il est possible de cacher la barre de navigation et de personnaliser une appBar et une floatingActionButton
  ///
  /// ---
  ///
  /// Example d'utilisation :
  /// ```
  /// XMobileScaffold(
  ///   currentIndex: 0,
  ///   body: const Center(
  ///     child: Text(
  ///       'Planning View',
  ///     ),
  ///    ),
  ///  );
  /// ```
  AppScaffold({
    Key? key,
    required this.body,
    this.isShowBottomNavigationBar = true,
    this.currentIndex = 0,
    this.floatingActionButton,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UiConstants.background,
        body: body,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: isShowBottomNavigationBar
            ? AppBottomNavigationBar(currentIndex: currentIndex)
            : null,
      ),
    );
  }
}
