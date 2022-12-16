import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_styles.dart';
import '../../../components/widgets/widgets.dart';
import '../controllers/to_do_detail_controller.dart';

class ToDoDetailView extends GetView<ToDoDetailController> {
  Map<String, dynamic> data;

  ToDoDetailView({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: AppStyles.semiBoldTextStyle(fontSize: 14.0, color: AppColors.COLOR_BLACK),
          ),

          const SizedBox(height: 8.0,),

          Text(
            data['title'],
            style: AppStyles.regularTextStyle(fontSize: 14.0, color: AppColors.COLOR_BLACK),
          ),

          const SizedBox(height: 15.0,),

          Text(
            'Description',
            style: AppStyles.semiBoldTextStyle(fontSize: 14.0, color: AppColors.COLOR_BLACK),
          ),

          const SizedBox(height: 8.0,),

          Text(
            data['desc'],
            style: AppStyles.regularTextStyle(fontSize: 14.0, color: AppColors.COLOR_BLACK),
          ),

          const SizedBox(height: 20.0,),

          Container(
            decoration: BoxDecoration(
                color: data['done']? AppColors.colorGreen : AppColors.RED_COLOR,
                borderRadius: BorderRadius.circular(32.0)
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Text(
              data['done']? 'Done' : 'To-do',
              textAlign: TextAlign.center,
              style: AppStyles.semiBoldTextStyle(fontSize: 16.0, color: AppColors.WHITE_COLOR),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBarLightTheme(text: 'To-Do'),
      body: body,
    );
  }
}
