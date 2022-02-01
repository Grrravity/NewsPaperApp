import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Controller/NotFound/not_found_view_controller.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';
import 'package:newspaperapp/Views/Widget/app_scaffold.dart';

class NotFoundView extends GetView<NotFoundViewController> {
  NotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowBottomNavigationBar: false,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: UiConstants.backgroundWhite,
        elevation: 1.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => Text(
              "NewsPaperApp",
              style:
                  UiConstants.h3Bold.copyWith(color: UiConstants.primaryBlue),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Page non trouvée',
                style: UiConstants.secondaryText12Red),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: UiConstants.primaryBlue),
                onPressed: () => Get.back(),
                child: const Icon(LineAwesomeIcons.undo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
