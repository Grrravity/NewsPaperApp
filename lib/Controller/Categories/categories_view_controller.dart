import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';
import 'package:newspaperapp/Core/Router/routes.dart';

class CategoriesViewController extends GetxController
    with StateMixin, GetSingleTickerProviderStateMixin {
  //Animation
  late AnimationController animationController;
  late Animation<double> animation;

  RxString category = ''.obs;

  @override
  void onInit() async {
    //Initialize animation for loader
    animationController = AnimationController(
        duration: const Duration(milliseconds: 750), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();

    change(null, status: RxStatus.loading());
    //NOTE Mock a loading
    await Future.delayed(const Duration(milliseconds: 250));
    try {
      //Get category set in cookies
      category.value = getCategoryTranslation(Get.find<Category>());
      if (category.value != '') {
        animationController.stop();
        change(null, status: RxStatus.success());
      } else {
        //Stop animation when not used anymore
        animationController.stop();
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      //Stop animation when not used anymore
      animationController.stop();
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onInit();
  }

  ///Reinit view
  resetView() async {
    change(null, status: RxStatus.loading());
    onInit();
    change(null, status: RxStatus.success());
  }

  ///Update category value and replace it in cookies (AKA Get.put)
  changeCategory(Category cat) {
    Get.replace<Category>(cat);
    category.value = getCategoryTranslation(cat);
    Get.offAllNamed(Routes.home);
  }
}
