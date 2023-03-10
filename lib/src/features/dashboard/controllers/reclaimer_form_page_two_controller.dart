import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/utils/validations.dart';

import 'reclaimer_form_controller.dart';

class ReclaimerFormPageTwoController extends GetxController {
  static ReclaimerFormPageTwoController get instance => Get.find();

  final controllerReclaimerForm = Get.find<ReclaimerFormController>();


  var bankNameController = TextEditingController();
  var accountNoController = TextEditingController();
  var ifscCodeController = TextEditingController();
  var rationCardController = TextEditingController();
  var voterIdCardController = TextEditingController();
  var eShramCardController = TextEditingController();
  var ayushmanCardController = TextEditingController();
  var aadharCardController = TextEditingController();

  RxString aadharCardFrontPath = "".obs;
  RxString aadharCardBackPath = "".obs;

  final formKeyPageTwo = GlobalKey<FormState>();
  final Validations validations = Validations(Get.context!);
  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;
  var isFormValidated=false;

  void validateAndUpdate() {
    if (formKeyPageTwo.currentState?.validate() == true) {
      isFormValidated=true;
      _saveData();
      controllerReclaimerForm.goToPage(2);
    }
  }


  void _saveData() {
    controllerReclaimerForm.reclaimerModel.bankName = bankNameController.text;

    controllerReclaimerForm.reclaimerModel.accountNumber =
        accountNoController.text;

    controllerReclaimerForm.reclaimerModel.ifscCode = ifscCodeController.text;


    controllerReclaimerForm.reclaimerModel.rationCardNo = rationCardController.text;



    controllerReclaimerForm.reclaimerModel.voterIdCardNo = voterIdCardController.text;
    controllerReclaimerForm.reclaimerModel.eShramCardNo = eShramCardController.text;
    controllerReclaimerForm.reclaimerModel.ayushCardNo = ayushmanCardController.text;
    controllerReclaimerForm.reclaimerModel.aadharCardNo = aadharCardController.text;
    controllerReclaimerForm.reclaimerModel.aadharCardFrontImage = aadharCardFrontPath.value;
    controllerReclaimerForm.reclaimerModel.aadharCardBackImage = aadharCardBackPath.value;

    print(controllerReclaimerForm.reclaimerModel.toJson());

  }

  void goToPage(int page){
    controllerReclaimerForm.goToPage(page);
  }

}
