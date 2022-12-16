import 'package:get/get.dart';

import '../controllers/add_to_do_controller.dart';

class AddToDoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToDoController>(
      () => AddToDoController(),
    );
  }
}
