import 'package:dexter_to_do/app/components/resources/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_constants.dart';
import 'app_fonts.dart';
/// App Styles Class -> Resource class for storing app level styles constants
class AppStyles {
  static TextStyle lightTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: AppFonts.LATO, fontWeight: FontWeight.w300);
  }

  static TextStyle regularTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: AppFonts.LATO, fontWeight: FontWeight.w400);
  }

  static TextStyle mediumTextStyle({double? fontSize, Color? color, double? letterSpacing, double? height}) {
    return TextStyle(
      color: color,
      height: height,
      fontSize: fontSize,
      fontFamily: AppFonts.LATO,
      fontWeight: FontWeight.w400,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle semiBoldTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: AppFonts.LATO, fontWeight: FontWeight.w600);
  }

  static TextStyle boldTextStyle({double? fontSize, Color? color}) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: AppFonts.LATO, fontWeight: FontWeight.w800);
  }

  static TextStyle inputTextStyle() {
    return const TextStyle(
        color: AppColors.COLOR_BLACK,
        fontSize: AppConstants.INPUT_TEXT_SIZE,
        fontFamily: AppFonts.LATO,
        fontWeight: FontWeight.w400
    );
  }

  static InputDecoration decorationLightTheme({required String title, Widget? prefixImage, Widget? suffixImage, Function()? onPressed, bool hasLabel = true}) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.COLOR_BLACK.withOpacity(0.5), width: 1.2)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.COLOR_BLACK.withOpacity(0.5), width: 1.2)
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.COLOR_BLACK.withOpacity(0.5), width: 1.2)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: AppColors.PRIMARY_COLOR, width: 1.2)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0)
      ),
      errorStyle: const TextStyle(
        color: Colors.red, // or any other color
      ),
      prefixIcon: prefixImage != null? IconButton(
          onPressed: null,
          icon: prefixImage
      ) : null,
      suffixIcon: suffixImage != null? IconButton(
        onPressed: onPressed,
        icon: suffixImage,
      ) : null,
      labelText: hasLabel? title : null,
      hintText: !hasLabel? title : null,
      floatingLabelStyle: AppStyles.regularTextStyle(fontSize: 12.0, color: AppColors.ACCENT_COLOR),
      focusColor: AppColors.PRIMARY_COLOR,
      labelStyle: AppStyles.regularTextStyle(fontSize: 12.0, color: AppColors.ACCENT_COLOR),
      hintStyle: AppStyles.regularTextStyle(fontSize: 12.0, color: AppColors.ACCENT_COLOR),
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 10.0),
    );
  }
}
