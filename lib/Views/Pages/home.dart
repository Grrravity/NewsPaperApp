import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Controller/Home/home_view_controller.dart';
import 'package:newspaperapp/Core/Router/routes.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';
import 'package:newspaperapp/Views/Widget/app_scaffold.dart';
import 'package:newspaperapp/Views/Widget/image_with_title.dart';

class HomeView extends GetView<HomeViewController> {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _buildContent(context),
      onLoading: AppScaffold(
        currentIndex: 0,
        body: const Center(
          child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      onEmpty: AppScaffold(
        currentIndex: 0,
        body: const Center(
            child:
                Text('Aucun contenu', style: UiConstants.secondaryText12Red)),
      ),
      onError: (error) => AppScaffold(
        currentIndex: 0,
        body: Center(
            child: Text(
                error ?? 'Erreur de chargement de la page. Réessayez plus tard',
                style: UiConstants.secondaryText12Red)),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppScaffold(
      currentIndex: 0,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: UiConstants.backgroundWhite,
        elevation: 1.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "NewsPaperApp",
            style: UiConstants.h1Bold.copyWith(color: UiConstants.primaryBlue),
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
                color: UiConstants.primaryBlack,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageWithTitle.sharp(
                width: size.width,
                height: size.width * 0.44,
                imageUrl:
                    'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
                title: 'title d sqjkld qsdjkl',
                date: DateTime.now()),
            const Text(
              'NewsPaperApp',
              style: UiConstants.h2Bold,
            ),
          ],
        ),
      ),
    );
  }
}
