import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController {
  static FirestoreController get instance => FirestoreController();

  Future updateChatRequestField({required int timeStamp, required String nurseId, required String title, required String desc}) async{
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('nurses').where('id', isEqualTo: nurseId).get();
    final List<DocumentSnapshot> documents = result.docs;

    if(documents.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('nurses')
          .doc(nurseId)
          .collection('toDoList')
          .doc()
          .set({
        'timeStamp': timeStamp,
        'title': title,
        'description': desc,
        'done': false
      });
    }
  }

  Future updateToDo({String? nurseId, String? toDoId, required bool done}) async{
    await FirebaseFirestore.instance
        .collection('nurses')
        .doc(nurseId)
        .collection('toDoList')
        .doc(toDoId)
        .update({
      'done': done,
    });
  }

  // Future<bool> ifChatExists({required String userID,required String chatID}) async {
  //   final DocumentSnapshot result = await FirebaseFirestore.instance
  //       .collection(AppStrings.FIREBASE_USERS_NODE)
  //       .doc(userID)
  //       .collection("chatlist")
  //       .doc(chatID)
  //       .get();
  //
  //   if(result.exists) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future updateChatListItem({required int timeStamp, String? userID, String? lastMessage, String? chatID, int? isFriend, int chatDeleteUpdate = 0}) async{
  //   await FirebaseFirestore.instance
  //       .collection(AppStrings.FIREBASE_USERS_NODE)
  //       .doc(userID)
  //       .collection('chatlist')
  //       .doc(chatID)
  //       .update({
  //     'lastChat': lastMessage,
  //     // 'isFriend':isFriend,
  //     'timestamp': timeStamp,
  //     'chatDelete' : chatDeleteUpdate
  //   });
  // }
}