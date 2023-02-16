import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class KSnackBar {
  static success({String title = "Success", required String message}) {
    return Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  static fail({String title = "Failed", required String message}) {
    return Get.snackbar(title, message,
        colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
  }
}
