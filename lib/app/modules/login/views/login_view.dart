import 'package:dexter_to_do/app/components/resources/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_images.dart';
import '../../../components/resources/app_styles.dart';
import '../../../components/widgets/widgets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/Util.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final body = GestureDetector(
      onTap: () {
        Util.hideKeyBoard(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Obx(
          () => Form(
          key: controller.formKey,
          autovalidateMode: controller.autoValidate.value,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(height: 10.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: AppStyles.semiBoldTextStyle(fontSize: 20.0, color: AppColors.COLOR_BLACK),
                    ),
                  ],
                ),

                const SizedBox(height: 30.0,),

                customTextField(
                  onFocusChange: (value) {
                    controller.emailFocusChange.value = value;
                  },
                  focusNode: controller.emailFocus,
                  hint: 'Email Address *'.tr,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: AppConstants.emailValidation,
                  textInputAction: TextInputAction.next,
                  nextFocus: controller.passwordNode,
                  context: context,
                  prefixImage: SvgPicture.asset(
                    ic_email_asset,
                    width: 20.0,
                    height: 20.0,
                    color: controller.emailFocusChange.value? AppColors.PRIMARY_COLOR : null,
                  ),
                  validator: (value) {
                    var emailRegex = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                    var email = controller.emailController.text.trim().toString();

                    if (email.isEmpty || email == "") {
                      return 'Email can not be empty';
                    } else if (!emailRegex.hasMatch(email)) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(height: 15.0,),

                Obx( () => customTextField(
                    onFocusChange: (value) {
                      controller.passwordFocusChange.value = value;
                    },
                    focusNode: controller.passwordNode,
                    hint: 'Password *'.tr,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: AppConstants.passwordValidation,
                    textInputAction: TextInputAction.done,
                    context: context,
                    prefixImage: Obx( () => SvgPicture.asset(
                      ic_password_asset,
                      width: 20.0,
                      height: 20.0,
                      color: controller.passwordFocusChange.value? AppColors.PRIMARY_COLOR : null,
                    )),
                    validator: (value) {
                      var password = controller.passwordController.text.trim().toString();

                      if (password.isEmpty || password == "") {
                        return 'Password can not be empty';
                      } else if (password.length < 6) {
                        return 'Password can not contain less than 6 characters';
                      } else if (password.length > 100) {
                        return 'Password can not contain more than 100 characters';
                      } else {
                        return null;
                      }
                    },
                    obscureText: controller.obscureText.value,
                    suffixImage: Obx(() => SvgPicture.asset(controller.iconData.value, width: 20.0, height: 20.0,)),
                    onSuffixIconPressed: () {
                      if (controller.obscureText.value) {
                        controller.obscureText.value = false;
                        controller.iconData.value = ic_eye_open_asset;
                      } else {
                        controller.obscureText.value = true;
                        controller.iconData.value = ic_eye_closed_asset;
                      }
                    }
                ),
                ),

                const SizedBox(height: 20.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Forgot Password?'.tr,
                          textAlign: TextAlign.center,
                          style: AppStyles.mediumTextStyle(fontSize: 13.0, color: AppColors.PRIMARY_COLOR),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25.0,),

                SizedBox(
                  width: double.maxFinite,
                  child: roundedButton(
                      text: 'Sign In',
                      onTap: () {
                        Util.hideKeyBoard(context);

                        if (controller.formKey.currentState!.validate()) {
                          Get.offAllNamed(Routes.HOME);
                        }
                        else {
                          controller.autoValidate.value = AutovalidateMode.always;
                        }
                      }
                  ),
                ),

                const SizedBox(height: 20.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'or'.tr,
                      textAlign: TextAlign.center,
                      style: AppStyles.regularTextStyle(fontSize: 15.0, color: AppColors.PRIMARY_COLOR),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0,),

                filledIconButton(
                    onTap: () { },
                    text: 'Sign in with Facebook',
                    backgroundColor: AppColors.FACEBOOK_BUTTON_COLOR,
                    icon: facebook_icon2_asset,
                    leftPadding: 15.0,
                    rightPadding: 2.0

                ),

                const SizedBox(height: 6.0,),

                filledIconButton(
                    onTap: () { },
                    text: 'Sign in with Google',
                    backgroundColor: AppColors.GOOGLE_BUTTON_COLOR,
                    icon: google_icon_asset,
                    leftPadding: 5.0,
                    rightPadding: 5.0

                ),

                const SizedBox(height: 6.0,),

                filledIconButton(
                    onTap: () { },
                    text: 'Sign in with Apple',
                    backgroundColor: AppColors.COLOR_BLACK,
                    icon: apple_icon_asset,
                    textColor: AppColors.WHITE_COLOR,
                    leftPadding: 0.0,
                    rightPadding: 5.0

                ),

                const SizedBox(height: 25.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      textAlign: TextAlign.center,
                      style: AppStyles.regularTextStyle(fontSize: 15.0, color: AppColors.COLOR_BLACK),
                    ),

                    const SizedBox(width: 5.0,),

                    InkWell(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: AppStyles.semiBoldTextStyle(fontSize: 18.0, color: AppColors.COLOR_BLACK),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25.0,),
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
