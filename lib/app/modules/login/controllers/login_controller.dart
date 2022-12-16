import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/resources/app_images.dart';

class LoginController extends GetxController {
  RxBool obscureText = true.obs;
  RxString iconData = ic_eye_closed_asset.obs;

  RxBool emailFocusChange = false.obs;
  RxBool passwordFocusChange = false.obs;

  var emailFocus = FocusNode();
  var passwordNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final Rx<AutovalidateMode> autoValidate = AutovalidateMode.onUserInteraction.obs;
}
