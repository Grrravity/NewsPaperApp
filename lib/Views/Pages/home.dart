import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Controller/Home/home_view_controller.dart';
import 'package:newspaperapp/Core/Router/routes.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';
import 'package:newspaperapp/Views/Widget/app_scaffold.dart';
import 'package:newspaperapp/Views/Widget/article_card.dart';
import 'package:newspaperapp/Views/Widget/image_with_title.dart';

class HomeView extends GetView<HomeViewController> {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        currentIndex: 0,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: UiConstants.backgroundWhite,
          elevation: 1.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "NewsPaperApp",
              style:
                  UiConstants.h2Bold.copyWith(color: UiConstants.primaryBlue),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.article);
                },
                icon: const Icon(
                  LineAwesomeIcons.search,
                  color: UiConstants.primaryBlue,
                ),
              ),
            ),
          ],
        ),
        body: controller.obx(
          (state) => _buildContent(context),
          onLoading: _buildLoader(context),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Aucun contenu',
                    style: UiConstants.secondaryText12Red),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UiConstants.primaryBlue),
                    onPressed: () => controller.resetView(),
                    child: const Icon(LineAwesomeIcons.sync_icon),
                  ),
                ),
              ],
            ),
          ),
          onError: (error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    error ??
                        'Erreur de chargement de la page. Réessayez plus tard',
                    style: UiConstants.secondaryText12Red),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UiConstants.primaryBlue),
                    onPressed: () => controller.resetView(),
                    child: const Icon(LineAwesomeIcons.sync_icon),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.toNamed(Routes.article);
            },
            child: ImageWithTitle.sharp(
                width: size.width,
                height: size.width * 0.44,
                imageUrl: controller.articles.first.urlToImage ?? '',
                title: controller.articles.first.title ?? 'Pas de titre',
                date: controller.articles.first.publishedAt ?? DateTime.now()),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: size.width,
                height: (size.height) -
                    (size.width * 0.44) -
                    UiConstants.safeAreaOffset,
                child: ListView.builder(
                    itemCount: controller.articles.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.article);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ArticleCard.simple(
                              article: controller.articles[index],
                              width: size.width,
                              height: 100),
                        ),
                      );
                    }),
              )),
        ],
      ),
    );
  }

  //Mock the ui with a fadein/out animation while loading
  _buildLoader(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FadeTransition(
      opacity: controller.animation,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.width * 0.44,
                  color: UiConstants.primaryGrey.withOpacity(0.5),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width - 120,
                          height: 30,
                          color: UiConstants.backgroundWhite,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: size.width - 240,
                          height: 20,
                          color: UiConstants.backgroundWhite,
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: size.width,
                  height: (size.height) -
                      (size.width * 0.44) -
                      UiConstants.safeAreaOffset,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  color:
                                      UiConstants.primaryGrey.withOpacity(0.5),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width - 200,
                                      height: 26,
                                      color: UiConstants.primaryGrey
                                          .withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: size.width - 240,
                                      height: 22,
                                      color: UiConstants.primaryGrey
                                          .withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: size.width - 300,
                                      height: 14,
                                      color: UiConstants.primaryGrey
                                          .withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
