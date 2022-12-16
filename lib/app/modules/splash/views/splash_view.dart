import 'package:animate_do/animate_do.dart';
import 'package:dexter_to_do/app/components/resources/app_colors.dart';
import 'package:dexter_to_do/app/components/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/resources/app_images.dart';
import '../../../components/widgets/widgets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/Util.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
              child: Image.asset(app_icon, height: 100.0, width: 100.0,)
          ),

          const SizedBox(height: 8.0,),

          BounceInUp(
            child: Text(
              'Dexter To-Do',
              style: AppStyles.boldTextStyle(fontSize: 25.0, color: AppColors.COLOR_BLACK),
            ),
          ),

          const SizedBox(height: 30.0,),

          BounceInUp(
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 60.0.w),
              child: roundedButton(
                  text: 'Get Started',
                  onTap: () {
                    Util.hideKeyBoard(context);
                    Get.offAllNamed(Routes.LOGIN);
                  }
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
