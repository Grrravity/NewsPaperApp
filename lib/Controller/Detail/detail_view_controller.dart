import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/Model/Database/database_model.dart';

class DetailViewController extends GetxController
    with StateMixin, GetSingleTickerProviderStateMixin {
  Rx<Articles> article = Articles().obs;
  //Animation
  late AnimationController animationController;
  late Animation<double> animation;

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
    await Future.delayed(const Duration(seconds: 3));
    try {
      String uuid = Get.parameters["uuid"] ?? '';
      Articles? targetArticle =
          await Articles().select().uuid.equals(uuid).toSingle();
      if (targetArticle != null) {
        article.value = targetArticle;
        //Stop animation when not used anymore
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
}
