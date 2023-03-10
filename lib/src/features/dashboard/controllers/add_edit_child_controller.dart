import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/models/child.dart';
import 'package:unigem_demo/src/features/dashboard/models/country.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/reclaimer_form_page_one_screen.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_three/reclaimer_form_page_three_screen.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_two/reclaimer_form_page_two_screen.dart';
import 'package:unigem_demo/src/utils/validations.dart';

class AddEditChildController extends GetxController {
  static AddEditChildController get instance => Get.find();

  var controllerPageOne = Get.find<ReclaimerFormPageOneController>();
  Validations validations = Validations(Get.context!);

  var fullNameController = TextEditingController();
  var genderController = TextEditingController();
  var schoolingController = TextEditingController();
  var ageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxString schoolingVisible = InputVisibility.Yes.name.obs;

  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;

  final List<String> genderItems = [
    "Male",
    "Female",
    "Other",
  ];

  void resetData() {
    fullNameController.text = "";
    genderController.text = "";
    schoolingController.text = "";
    ageController.text = "";
  }
}
