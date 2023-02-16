import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/features/authentication/models/user_model.dart';
import 'package:unigem_demo/src/repository/repository/authentication_repository/authentication_repository.dart';
import 'package:unigem_demo/src/repository/repository/user_repository/user_repository.dart';
import 'package:unigem_demo/src/utils/snack_bar.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(UserModel user) async {

    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(user.email, user.password,user.fullName) as String?;
    if (error != null) {
      KSnackBar.fail(message: error.toString());
    }else{
      await userRepo.createUser(user);
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
