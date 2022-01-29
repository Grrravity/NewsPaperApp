import 'package:get/get.dart';

class HomeViewController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
