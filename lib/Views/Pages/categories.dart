import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Controller/Categories/categories_view_controller.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';
import 'package:newspaperapp/Views/Widget/app_scaffold.dart';
import 'package:newspaperapp/Views/Widget/category_thumbnail.dart';

class CategoriesView extends GetView<CategoriesViewController> {
  CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        currentIndex: 1,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: UiConstants.backgroundWhite,
          elevation: 1.0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(
              () => Text(
                "Catégories par défault : ${controller.category}",
                style:
                    UiConstants.h3Bold.copyWith(color: UiConstants.primaryBlue),
              ),
            ),
          ),
        ),
        body: controller.obx(
          (state) => _buildContent(),
          onLoading: _buildLoader(),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Aucun résultat',
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

  Widget _buildContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: Category.values.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                  onTap: () {
                    controller.changeCategory(Category.values[index]);
                  },
                  child: CategoryThumbnail(
                    boxFit: BoxFit.fitHeight,
                    title: getCategoryTranslation(Category.values[index]),
                    imageUrl: getCategoryImagePath(Category.values[index]),
                  ));
            }),
      ),
    );
  }

  Widget _buildLoader() {
    return FadeTransition(
      opacity: controller.animation,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 12,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: UiConstants.primaryGrey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                );
              }),
        ),
      ),
    );
  }
}
