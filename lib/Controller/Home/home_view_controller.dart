import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';
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
  late Category category;
  List<Articles> articles = <Articles>[].obs;
  Rx<Articles> topArticle = Articles().obs;
  Map<String, String> sortMap = {
    'Aucun': '',
    'Pertinence': 'relevancy',
    'Popularité': 'popularity',
    'Date de publication': 'publishedAt'
  };
  Map<String, String> languageMap = {
    'Aucune': '',
    'Deutsch': 'de',
    'English': 'en',
    'Español': 'es',
    'Français': 'fr',
    'Italiano': 'it'
  };
  //Search form
  late TextEditingController searchItemController;
  RxString search = ''.obs;
  RxInt sortValue = 0.obs;
  RxInt languageValue = 4.obs;
  RxBool isSearching = false.obs;
  RxBool isOffLine = false.obs;

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

    searchItemController =
        TextEditingController(text: search.value.toLowerCase());

    category = Get.find<Category>();

    await resetView();
    super.onInit();
  }

  Future<void> getLocalData() async {
    articles = await Articles().select().toList();
    Toast.showSnackBar(
        context: Get.context!,
        snackBar: Toast.warning(
            message:
                "Aucun accès internet, les données affichées sont celles stockés localement",
            action: SnackBarAction(
              label: 'REINITIALISER',
              textColor: UiConstants.secondaryGreen,
              onPressed: () {
                resetView();
              },
            )));
  }

  /// Fetch data and remplace all local data with the result
  /// If result is empty, get local data instead
  Future<void> fetchFromApi() async {
    articles.clear();
    await topRepositoryImpl.getTopArticles(
      queryParameters: {"category": category.toShortString()},
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
                snackBar: Toast.warning(
                    message: "Certaines données n'ont pas été sauvegardées"));
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

  resetView() async {
    change(null, status: RxStatus.loading());
    isSearching.value = false;
    //Get data
    if (await hasInternet()) {
      await fetchFromApi();
    } else {
      await getLocalData();
    }
    //populate vars
    resetArticles();
  }

  resetArticles() {
    try {
      if (articles.isNotEmpty) {
        topArticle.value = articles.elementAt(0);
        articles.removeAt(0);
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
  }

  /// Request result from everything query then update UI
  Future<void> searchArticles(String value) async {
    change(null, status: RxStatus.loading());
    if (await hasInternet()) {
      isSearching.value = true;
      articles.clear();
      Map<String, dynamic> queryParam = {};
      if (value != '') {
        queryParam.addAll({"q": value});
      }
      if (sortValue.value != 0) {
        queryParam
            .addAll({"sortBy": sortMap.values.elementAt(sortValue.value)});
      }
      if (languageValue.value != 0) {
        queryParam.addAll(
            {"language": languageMap.values.elementAt(languageValue.value)});
      }
      await everythingRepository
          .getArticles(
            queryParameters: queryParam,
          )
          .then((option) => option.fold((l) async {
                articles = [];
                resetArticles();
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
                  resetArticles();
                  return;
                } else if (result.any((element) => element.success)) {
                  Toast.showSnackBar(
                      context: Get.context!,
                      snackBar: Toast.warning(
                          message:
                              "Certaines données n'ont pas été sauvegardées"));
                  resetArticles();
                  return;
                } else {
                  Toast.showSnackBar(
                      context: Get.context!,
                      snackBar: Toast.error(
                          message: "Les données n'ont pas été sauvegardées"));
                  resetArticles();
                  return;
                }
              }));
    } else {
      await getLocalData();
      change(null, status: RxStatus.success());
    }
  }

  resetSearchValues() {
    search.value = '';
    sortValue.value = 0;
    languageValue.value = 3;
  }

  Future<bool> hasInternet() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    isOffLine.value = connectivityResult != ConnectivityResult.none &&
            connectivityResult != ConnectivityResult.bluetooth
        ? true
        : false;
    return isOffLine.value;
  }
}
