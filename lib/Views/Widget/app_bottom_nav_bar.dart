import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Core/Router/routes.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';

class AppBottomNavigationBar extends StatelessWidget {
  int currentIndex;

  /// Mobile navigation bar
  ///
  /// ```
  /// AppBottomNavigationBar(
  ///   currentIndex: currentIndex,
  /// ),
  /// ```
  ///
  AppBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        label: 'Accueil',
        icon: Icon(
          LineAwesomeIcons.home,
        ),
      ),
      const BottomNavigationBarItem(
        label: 'Catégories',
        icon: Icon(
          LineAwesomeIcons.grip_vertical,
        ),
      ),
    ];

    return BottomNavigationBar(
      elevation: 1,
      backgroundColor: UiConstants.backgroundWhite,
      selectedItemColor: UiConstants.primaryBlue,
      unselectedItemColor: UiConstants.primaryGrey,
      currentIndex: currentIndex,
      onTap: (value) {
        if (currentIndex != value) navigateTo(value);
      },
      // pages avalable
      items: items,
    );
  }

  /// Allow navigation to page
  void navigateTo(int value) async {
    try {
      switch (value) {
        case 0:
          Get.offAllNamed(Routes.home);
          break;
        case 1:
          Get.offAllNamed(Routes.notFound);
          break;

        default:
          Get.offAllNamed(Routes.home);
          break;
      }
    } catch (e) {
      // TODO - Logger l'erreur
      rethrow;
    }
  }
}
