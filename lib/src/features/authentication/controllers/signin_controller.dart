import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/repository/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController{
  static SignInController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();


  Future<void> signInUser(String email,String password) async {
  await AuthenticationRepository.instance.signInUserWithEmailAndPassword(email, password) as String?;

  }
}