import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/repository/repository/authentication_repository.dart';


class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();



  Future<void> resetPassword() async {
   await AuthenticationRepository.instance.resetPassword(email: email.text.trim().toString());
  }
}
