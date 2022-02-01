import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'categories_view_controller.dart';

class CategoriesControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CategoriesViewController(),
    );
  }
}
