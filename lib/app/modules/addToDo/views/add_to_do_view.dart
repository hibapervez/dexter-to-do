import 'package:dexter_to_do/app/components/resources/app_colors.dart';
import 'package:dexter_to_do/app/components/resources/app_constants.dart';
import 'package:dexter_to_do/app/utils/Util.dart';
import 'package:dexter_to_do/app/utils/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../components/widgets/widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/add_to_do_controller.dart';

class AddToDoView extends GetView<AddToDoController> {
  @override
  Widget build(BuildContext context) {
    final body = GestureDetector(
      onTap: () {
        Util.hideKeyBoard(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: controller.autoValidate.value,
          child: Column(
            children: [
              customTextField(
                onFocusChange: (value) {
                  controller.titleFocusChange.value = value;
                },
                focusNode: controller.titleFocus,
                hint: 'Title *'.tr,
                controller: controller.titleController,
                keyboardType: TextInputType.text,
                maxLength: AppConstants.nameValidation,
                textInputAction: TextInputAction.next,
                nextFocus: controller.descFocus,
                context: context,
                validator: (value){
                  String fullName = controller.titleController.text.trim().toString();
                  if(fullName.isEmpty || fullName == "") {
                    return 'Title can not be empty';
                  }else if(fullName.length > 50) {
                    return 'Title can not be greater than 50 characters';
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(height: 15.0,),

              customTextField(
                onFocusChange: (value) {
                  controller.descFocusChange.value = value;
                },
                focusNode: controller.descFocus,
                hint: 'Description *'.tr,
                controller: controller.descController,
                keyboardType: TextInputType.text,
                maxLength: AppConstants.descValidation,
                textInputAction: TextInputAction.done,
                context: context,
                maxLines: 10,
                validator: (value){
                  String fullName = controller.descController.text.trim().toString();
                  if(fullName.isEmpty || fullName == "") {
                    return 'Description can not be empty';
                  }else if(fullName.length > 1000) {
                    return 'Description can not be greater than 1000 characters';
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(height: 30.0,),

              SizedBox(
                width: double.maxFinite,
                child: roundedButton(
                    text: 'Add',
                    onTap: () {
                      Util.hideKeyBoard(context);

                      if (controller.formKey.currentState!.validate()) {
                        var timeStamp = DateTime.now().millisecondsSinceEpoch;

                        FirestoreController().updateChatRequestField(
                          timeStamp: timeStamp,
                          nurseId: '1',
                          title: controller.titleController.text.trim().toString(),
                          desc: controller.descController.text.trim().toString()
                        );
                        Get.back();
                      }
                      else {
                        controller.autoValidate.value = AutovalidateMode.always;
                      }
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBarLightTheme(text: 'Add To-Do'),
      body: body,
    );
  }
}
