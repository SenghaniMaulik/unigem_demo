import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';

class KSnackBar {
  static success({String title = "Success", required String message}) {
    return Get.snackbar(title, message,
        backgroundColor: AppColor.white, snackPosition: SnackPosition.TOP);
  }

  static fail({String title = "Failed", required String message}) {
    return Get.snackbar(title, message,
        backgroundColor: AppColor.white,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP);
  }
}
