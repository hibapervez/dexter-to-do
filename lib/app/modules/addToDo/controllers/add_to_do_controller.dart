import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToDoController extends GetxController {
  RxBool titleFocusChange = false.obs;
  RxBool descFocusChange = false.obs;

  var titleFocus = FocusNode();
  var descFocus = FocusNode();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final Rx<AutovalidateMode> autoValidate = AutovalidateMode.onUserInteraction.obs;
}
