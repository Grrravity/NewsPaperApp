import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_toast.dart';
import 'package:newspaperapp/Infrastructure/Repositories/everything_repository_impl.dart';
import 'package:newspaperapp/Infrastructure/Repositories/top_repository_impl.dart';

class HomeViewController extends GetxController
    with StateMixin, GetSingleTickerProviderStateMixin {
  final EverythingRepositoryImpl everythingRepository;
  final TopRepositoryImpl topRepositoryImpl;

  HomeViewController(
      {required this.everythingRepository, required this.topRepositoryImpl});

  //Animation
  late AnimationController animationController;
  late Animation<double> animation;

  //Variables
  List<Articles> articles = <Articles>[].obs;
  Rx<Articles> topArticle = Articles().obs;

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
    try {
      //Get articles
      articles = await Articles().select().toList();
      //TODO Remove when api is connected
      articles = [Articles(), Articles(), Articles(), Articles()];

      if (articles.isNotEmpty) {
        topArticle.value = articles.elementAt(0);
        articles.removeAt(0);
        //TODO Remove when api is connected
        await Future.delayed(const Duration(seconds: 5));
        //Stops animation when not used anymore
        animationController.stop();
        change(null, status: RxStatus.success());
      } else {
        //TODO Remove when api is connected
        await Future.delayed(const Duration(seconds: 5));
        //Stops animation when not used anymore
        animationController.dispose();
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      //Stops animation when not used anymore
      animationController.dispose();
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onInit();
  }
}
