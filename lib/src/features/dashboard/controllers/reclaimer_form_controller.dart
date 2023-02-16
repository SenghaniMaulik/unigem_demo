import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/repository/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Pages.dart';

class ReclaimerFormController extends GetxController {
  static ReclaimerFormController get instance => Get.find();

  PageController pageController = PageController();

  final List<Widget> list = <Widget>[
    Center(
        child: Pages(
      text: "Page 1",
    )),
    Center(
        child: Pages(
      text: "Page 2",
    )),
    Center(
        child: Pages(
      text: "Page 3",
    )),
    Center(
        child: Pages(
          text: "Page 4",
        )),
  ];
  final RxInt currentPage = 0.obs;


   RxBool isSelected (int itemPos) =>(currentPage.value == itemPos).obs;

  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;




}
