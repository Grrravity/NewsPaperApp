import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_toast.dart';
import 'package:newspaperapp/Infrastructure/Repositories/everything_repository_impl.dart';
import 'package:newspaperapp/Infrastructure/Repositories/top_repository_impl.dart';
import 'package:newspaperapp/Model/Database/database_model.dart';
import 'package:uuid/uuid.dart';

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
    //Get data
    if (await hasInternet()) {
      await fetchFromApi();
    } else {
      await getLocalData();
    }
    //populate vars
    try {
      if (articles.isNotEmpty) {
        topArticle.value = articles.elementAt(0);
        articles.removeAt(0);
        //Stop animation when not used anymore
        animationController.stop();
        change(null, status: RxStatus.success());
      } else {
        //Stop animation when not used anymore
        animationController.dispose();
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      //Stop animation when not used anymore
      animationController.dispose();
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onInit();
  }

  Future<void> getLocalData() async {
    articles = await Articles().select().toList();
  }

  /// Fetch data and remplace all local data with the result
  /// If result is empty, get local data instead
  Future<void> fetchFromApi() async {
    articles.clear();
    await topRepositoryImpl.getTopArticles(
      queryParameters: {"category": "business"},
    ).then((option) => option.fold((l) async {
          articles = [];
          await getLocalData();
          return;
        }, (r) async {
          articles.addAll(r);
          await Articles().select(getIsDeleted: true).delete(true);
          for (var element in articles) {
            element.uuid = const Uuid().v4();
            element.plSources?.uuid = const Uuid().v4();
          }
          final result = await Articles.saveAll(articles);
          if (result.every((element) => element.success)) {
            Toast.showSnackBar(
                context: Get.context!,
                snackBar: Toast.success(message: "Données sauvegardées"));
            return;
          } else if (result.any((element) => element.success)) {
            Toast.showSnackBar(
                context: Get.context!,
                snackBar: Toast.simple(
                    message: "Les données n'ont pas été sauvegardées"));
            return;
          } else {
            Toast.showSnackBar(
                context: Get.context!,
                snackBar: Toast.error(
                    message: "Les données n'ont pas été sauvegardées"));
            return;
          }
        }));
  }

  /// Fetch data and remplace all local data with the result
  /// If result is empty, get local data instead
  Future<void> searchArticle() async {
    articles.clear();
    await everythingRepository.getArticles(
      queryParameters: {"q": "business"},
    ).then((option) => option.fold((l) async {
          articles = [];
          await getLocalData();
          return;
        }, (r) async {
          articles.addAll(r);
          await Articles().select(getIsDeleted: true).delete(true);
          for (var element in articles) {
            element.uuid = const Uuid().v4();
            element.plSources?.uuid = const Uuid().v4();
          }
          final result = await Articles.saveAll(articles);
          if (result.every((element) => element.success)) {
            Toast.showSnackBar(
                context: Get.context!,
                snackBar: Toast.success(message: "Données sauvegardées"));
            return;
          } else if (result.any((element) => element.success)) {
            Toast.showSnackBar(
                context: Get.context!,
                snackBar: Toast.simple(
                    message: "Les données n'ont pas été sauvegardées"));
            return;
          } else {
            Toast.showSnackBar(
                context: Get.context!,
                snackBar: Toast.error(
                    message: "Les données n'ont pas été sauvegardées"));
            return;
          }
        }));
  }

  Future<bool> hasInternet() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none &&
            connectivityResult != ConnectivityResult.bluetooth
        ? true
        : false;
  }
}
