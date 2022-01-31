import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Controller/Detail/detail_view_controller.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';
import 'package:newspaperapp/Core/Router/routes.dart';
import 'package:newspaperapp/Views/Widget/app_scaffold.dart';
import 'package:newspaperapp/Views/Widget/image_with_title.dart';

class DetailView extends GetView<DetailViewController> {
  DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isShowBottomNavigationBar: false,
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
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Get.offAndToNamed(Routes.home);
              },
              icon: const Icon(
                LineAwesomeIcons.arrow_left,
                color: UiConstants.primaryBlue,
              ),
            ),
          ),
        ),
        body: controller.obx(
          (state) => _buildContent(context),
          onLoading: _buildLoader(context),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Article introuvable, revenir en lieu sûr ?',
                    style: UiConstants.secondaryText12Red),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UiConstants.primaryBlue),
                    onPressed: () => Get.offAndToNamed(Routes.home),
                    child: const Icon(LineAwesomeIcons.undo),
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
                        'Erreur de chargement de la page. revenir en lieu sûr?',
                    style: UiConstants.secondaryText12Red),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UiConstants.primaryBlue),
                    onPressed: () => Get.offAndToNamed(Routes.home),
                    child: const Icon(LineAwesomeIcons.undo),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageWithTitle.sharp(
              width: size.width,
              height: size.width * 0.66,
              imageUrl: controller.article.value.urlToImage ?? '',
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.article.value.title!,
                    style: UiConstants.h3Bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: <TextSpan>[
                      if (controller.article.value.publishedAt != null)
                        TextSpan(
                          text: DateFormat('dd/MM/yyyy HH:mm').format(
                                  controller.article.value.publishedAt!) +
                              ' - ',
                          style: UiConstants.regularText12Grey,
                        ),
                      if (controller.article.value.author != null)
                        TextSpan(
                          text: controller.article.value.author!,
                          style: UiConstants.regularText12Grey,
                        ),
                    ]),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: UiConstants.secondaryBlue),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                controller.article.value.content! +
                    ' ' +
                    controller.article.value.content! +
                    ' ' +
                    controller.article.value.content! +
                    ' ' +
                    controller.article.value.content! +
                    ' ',
                style: UiConstants.regularText14.copyWith(height: 1.6),
              ),
            ),
          ],
        ),
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
            Container(
              width: size.width,
              height: size.width * 0.66,
              color: UiConstants.primaryGrey.withOpacity(0.5),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: size.width,
                  height: (size.height) -
                      (size.width * 0.66) -
                      UiConstants.safeAreaOffset,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width - 200,
                                height: 26,
                                color: UiConstants.primaryGrey.withOpacity(0.5),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                width: size.width - 240,
                                height: 26,
                                color: UiConstants.primaryGrey.withOpacity(0.5),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                width: size.width - 300,
                                height: 26,
                                color: UiConstants.primaryGrey.withOpacity(0.5),
                              ),
                            ],
                          ),
                        );
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
