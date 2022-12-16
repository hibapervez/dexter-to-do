import 'package:flutter/material.dart';

class Util {
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode()); //DateFormat('MMM/dd/yyyy').format(date);
  }
}