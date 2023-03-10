import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/features/dashboard/models/child.dart';
import 'package:unigem_demo/src/features/dashboard/models/country.dart';
import 'package:unigem_demo/src/utils/validations.dart';

import 'reclaimer_form_controller.dart';

class ReclaimerFormPageOneController extends GetxController {
  static ReclaimerFormPageOneController get instance => Get.find();
  final controllerReclaimerForm = Get.find<ReclaimerFormController>();

  Validations validations = Validations(Get.context!);
  final Rxn<CountrySelected> countrySelected = Rxn<CountrySelected>();
  var fullNameController = TextEditingController();
  var primaryMobileController = TextEditingController();
  var emailIdController = TextEditingController();
  var familyCountController = TextEditingController();
  var capacityPerDayController = TextEditingController();
  var smallScrapDealerNameController = TextEditingController();
  var collectionCenterController = TextEditingController();
  var countryNameController = TextEditingController();
  var countryFlagController = TextEditingController();
  var stateController = TextEditingController();
  var districtController = TextEditingController();
  var cityController = TextEditingController();
  var pinCodeController = TextEditingController();
  var materialProvidedController = TextEditingController();
  final formKeyPageOne = GlobalKey<FormState>();

  var isFormValidated=false;

  @override
  void onReady() {
    var countrySelected = CountrySelected();
    countryNameController.text =
        "${countrySelected.flag}  ${countrySelected.name}";
  }

  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;

  final List<String> stateItems = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Orissa",
    "Pondicherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttaranchal",
    "Uttar Pradesh",
    "West Bengal"
  ];
  final List<String> districtItems = [
    "Kutch",
    "Anand",
    "Valsad",
    "Bharuj",
  ];

  final List<String> cityItems = [
    "Ahmedabad",
    "Gandhinagar",
    "Mandvi",
    "Bhuj",
  ];

  // var childList = <Child>[].obs;

  RxList<Child> childList = (List<Child>.of([])).obs;

  void deleteChild(Child child) {
    childList.remove(child);
    childList.refresh();
    print(childList.length);
  }

  void addChild(Child child) {
    childList.add(child);
    childList.refresh();
    print(childList.length);
  }

  void editChild(Child child, int pos) {
    childList.removeAt(pos);
    childList.insert(pos, child);
    print(childList.length);
  }

  bool validateAndUpdate() {
    if (formKeyPageOne.currentState?.validate() == true) {
      isFormValidated=true;
      _saveData();
      controllerReclaimerForm.goToPage(1);
    }
    return isFormValidated;
  }

  void _saveData() {
    controllerReclaimerForm.reclaimerModel.fullName = fullNameController.text;

    controllerReclaimerForm.reclaimerModel.primaryMobileNumber =
        primaryMobileController.text;

    controllerReclaimerForm.reclaimerModel.emailId = emailIdController.text;

    controllerReclaimerForm.reclaimerModel.familyCount =
        familyCountController.text.isEmpty
            ? 0
            : int.parse(familyCountController.text);

    controllerReclaimerForm.reclaimerModel.children = childList.map((element) => element.toJson()).toList();

    controllerReclaimerForm.reclaimerModel.capacityPerDay =
        capacityPerDayController.text.isEmpty
            ? 0
            : int.parse(capacityPerDayController.text);

    controllerReclaimerForm.reclaimerModel.smallScrapDealerName =
        smallScrapDealerNameController.text;
    controllerReclaimerForm.reclaimerModel.collectionCenter =
        collectionCenterController.text;
    controllerReclaimerForm.reclaimerModel.country = countrySelected.value?.name;
    controllerReclaimerForm.reclaimerModel.state = stateController.text;
    controllerReclaimerForm.reclaimerModel.district = districtController.text;
    controllerReclaimerForm.reclaimerModel.city = cityController.text;
    controllerReclaimerForm.reclaimerModel.pin = pinCodeController.text;
    controllerReclaimerForm.reclaimerModel.materialProvided =
        materialProvidedController.text;

    // print(controllerReclaimerForm.reclaimerModel.toJson());
  }
}
