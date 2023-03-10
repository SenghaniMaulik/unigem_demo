import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/repository/repository/authentication_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;

  void logout() {
    AuthenticationRepository.instance.logout();
  }
}
