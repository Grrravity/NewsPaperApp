import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'detail_view_controller.dart';

class DetailControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DetailViewController(),
    );
  }
}
