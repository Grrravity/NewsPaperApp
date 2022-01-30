import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:newspaperapp/Controller/Home/home_view_controller.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_client.dart';
import 'package:newspaperapp/Infrastructure/Repositories/everything_repository_impl.dart';
import 'package:newspaperapp/Infrastructure/Repositories/top_repository_impl.dart';

class HomeControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeViewController(
        everythingRepository:
            EverythingRepositoryImpl(client: Get.find<RestApiClient>().client),
        topRepositoryImpl:
            TopRepositoryImpl(client: Get.find<RestApiClient>().client),
      ),
    );
  }
}
