import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_to_do/app/components/resources/app_colors.dart';
import 'package:dexter_to_do/app/routes/app_pages.dart';
import 'package:dexter_to_do/app/utils/firestore_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/resources/app_styles.dart';
import '../../../components/widgets/widgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final body = Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('nurses')
                .doc('1')
                .collection('toDoList')
                // .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.PRIMARY_COLOR)),
                );
              } else {
                if (snapshot.data!.docs.length == null || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No tasks in the list yet!',
                      style: AppStyles.semiBoldTextStyle(fontSize: 16.0, color: AppColors.COLOR_BLACK),
                    ),
                  );
                } else {
                  return ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Divider(),
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return toDoItemWidget(snapshot.data!.docs[index]);
                      });
                }
              }
            }
          ),
        )
      ],
    );
    
    return Scaffold(
      appBar: appBarLightTheme(text: 'To-Do'),
      body: body,
      floatingActionButton: addFloatingButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_TO_DO);
        }
      ),
    );
  }
  
  Widget toDoItemWidget(QueryDocumentSnapshot data) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.TO_DO_DETAIL, arguments: {
          'title' : data['title'],
          'desc' : data['description'],
          'done' : data['done'],
        });
      },
      child: Row(
        children: [
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              checkColor: Colors.white,
              activeColor: AppColors.ACCENT_COLOR,
              value: data['done'],
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                FirestoreController().updateToDo(
                  done: value!,
                  nurseId: '1',
                  toDoId: data.id
                );
              },
            ),
          ),

          Expanded(
            child: Text(
              data['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.semiBoldTextStyle(fontSize: 17.0, color: AppColors.COLOR_BLACK),
            ),
          )
        ],
      ),
    );
  }
}
