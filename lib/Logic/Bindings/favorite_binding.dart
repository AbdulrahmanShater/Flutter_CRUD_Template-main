import 'package:get/instance_manager.dart';

import '../Controller/favourite_controller.dart';

class FavoriteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteController>(FavoriteController());
  }
}
