import 'package:animate_do/animate_do.dart';
import 'package:dexter_to_do/app/components/resources/app_colors.dart';
import 'package:dexter_to_do/app/components/resources/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../resources/app_styles.dart';

Widget customTextField({Function(bool)? onFocusChange, FocusNode? focusNode, String? Function(String?)? validator, Function(String)? onChanged, TextEditingController? controller, TextInputType? keyboardType, int? maxLength, int? maxLines, TextInputAction? textInputAction, Widget? prefixImage, String? hint, BuildContext? context, FocusNode? nextFocus, bool enabled = true, bool obscureText = false, Widget? suffixImage, Function()? onSuffixIconPressed, bool hasLabel = true, bool lightTheme = false}) {
  return FlipInY(
    duration: const Duration(seconds: 1),
    child: Focus(
      onFocusChange: onFocusChange,
      child: TextFormField(
        focusNode: focusNode,
        enabled: enabled,
        cursorColor: AppColors.PRIMARY_COLOR,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: false,
          selectAll: false,
        ),
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@. ]")),
          LengthLimitingTextInputFormatter(maxLength),
        ],
        onEditingComplete: () =>
        nextFocus != null? FocusScope.of(context!).requestFocus(nextFocus) : FocusScope.of(context!).unfocus(),
        onFieldSubmitted: (text) {
          nextFocus != null? FocusScope.of(context!).requestFocus(nextFocus) : FocusScope.of(context!).unfocus();
        },
        textInputAction: textInputAction,
        obscureText: obscureText,
        decoration: AppStyles.decorationLightTheme(
            title: hint!,
            hasLabel: hasLabel,
            prefixImage: prefixImage != null? Padding(
                padding: const EdgeInsets.all(8.0),
                child: prefixImage
            ) : null,
            suffixImage: Padding(
              padding: const EdgeInsets.all(7.0),
              child: suffixImage,
            ),
            onPressed: onSuffixIconPressed
        ),
        style: AppStyles.inputTextStyle(),
      ),
    ),
  );
}

Widget roundedButton({required String text, required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(32.0)
      ),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppStyles.semiBoldTextStyle(fontSize: 16.0, color: AppColors.WHITE_COLOR),
      ),
    ),
  );
}

Widget filledIconButton({
  required String text,
  required Function() onTap,
  required String icon,
  required Color backgroundColor,
  Color textColor = Colors.white,
  double leftPadding = 0.0 ,
  double rightPadding =0.0,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: leftPadding,right: rightPadding),
              child: Image.asset(icon, width: 20.0, height: 20.0, color: AppColors.WHITE_COLOR,),
            ),

            SizedBox(width: 5.0,),


            Text(
                text,
                style: AppStyles.regularTextStyle(fontSize: 14.0, color: textColor)
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(32.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
    ),
  );
}

AppBar appBarLightTheme({required String text, bool backButton = true, bool notification = false}) {
  return AppBar(
    elevation: 0.0,
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyles.semiBoldTextStyle(fontSize: 17.0, color: AppColors.WHITE_COLOR),
    ),
    leading: backButton? IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        CupertinoIcons.back,
        size: 25.0,
        color: AppColors.WHITE_COLOR,
      ),
    ) : Container(),
    backgroundColor: AppColors.PRIMARY_COLOR,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light
    )
  );
}

Widget addFloatingButton({required Function() onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed,
    heroTag: null,
    backgroundColor: AppColors.ACCENT_COLOR,
    child: SvgPicture.asset(ic_add_asset, color: AppColors.WHITE_COLOR, width: 28.0, height: 28.0,),
  );
}