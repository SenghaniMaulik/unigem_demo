import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_three_controller.dart';
import 'package:unigem_demo/src/features/dashboard/models/ReclaimerModel.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/reclaimer_form_page_one_screen.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_three/reclaimer_form_page_three_screen.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_two/reclaimer_form_page_two_screen.dart';
import 'package:unigem_demo/src/repository/repository/reclaimer_repository.dart';
import 'package:unigem_demo/src/utils/snack_bar.dart';

import 'reclaimer_form_page_two_controller.dart';

class ReclaimerFormController extends GetxController {
  static ReclaimerFormController get instance => Get.find();

  PageController pageController = PageController();
  ReclaimerModel reclaimerModel = ReclaimerModel();

  final reclaimerRepository = Get.put(ReclaimerRepository());



  final List<Widget> list = <Widget>[
    const ReclaimerFormPageOneScreen(),
    const ReclaimerFormPageTwoScreen(),
    const ReclaimerFormPageThreeScreen(),
  ];
  final RxInt currentPage = 0.obs;

  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;

  void goToPage(int page) {
    if (!ReclaimerFormPageOneController.instance.isFormValidated && page==1) {
      KSnackBar.fail(message: "Please enter required data in from one");
      return;
    } else if (page==2 && !ReclaimerFormPageTwoController.instance.isFormValidated ) {
      KSnackBar.fail(message: "Please enter required data in from two");
      return;
    }
    pageController.jumpToPage(page);
  }

  Future<void> createReclaimer(ReclaimerModel reclaimerModel) async {
    await reclaimerRepository.createReclaimer(reclaimerModel);
  }
}
