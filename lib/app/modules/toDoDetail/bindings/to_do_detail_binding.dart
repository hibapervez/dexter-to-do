import 'package:get/get.dart';

import '../controllers/to_do_detail_controller.dart';

class ToDoDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoDetailController>(
      () => ToDoDetailController(),
    );
  }
}
