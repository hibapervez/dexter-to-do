import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  void getRoute() async {
    print('here2');
    Get.offAndToNamed(Routes.LOGIN);
  }
}
