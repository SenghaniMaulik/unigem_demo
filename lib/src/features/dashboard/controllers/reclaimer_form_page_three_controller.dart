import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/constants/progress_bar.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_two_controller.dart';
import 'package:unigem_demo/src/repository/repository/authentication_repository.dart';
import 'package:unigem_demo/src/repository/repository/reclaimer_repository.dart';
import 'package:unigem_demo/src/utils/validations.dart';

import '../../../utils/snack_bar.dart';
import 'reclaimer_form_controller.dart';

class ReclaimerFormPageThreeController extends GetxController {
  static ReclaimerFormPageThreeController get instance => Get.find();

  final controllerReclaimerForm = Get.find<ReclaimerFormController>();
  final controllerReclaimerPageOne = Get.find<ReclaimerFormPageOneController>();
  final controllerReclaimerPageTwo = Get.find<ReclaimerFormPageTwoController>();
  RxString profilePicPath = "".obs;
  RxString eventPicPath = "".obs;

  final TextTheme textTheme = Theme.of(Get.context!).textTheme;
  final AppLocalizations local = AppLocalizations.of(Get.context!)!;

  Future<void> validateAllData(BuildContext context) async {
    if (!controllerReclaimerPageOne.isFormValidated) {
      KSnackBar.fail(message: "Please enter required data in from one");
    } else if (!controllerReclaimerPageTwo.isFormValidated) {
      KSnackBar.fail(message: "Please enter required data in from two");
    } else {
      AppProgress(context).showLoaderDialog();
      await _saveData();
      Navigator.pop(context);
      Get.back();
    }
  }

  Future<void> _saveData() async {
    var reclaimerModel = controllerReclaimerForm.reclaimerModel;
    var reclaimerRepository = ReclaimerRepository.instance;
    reclaimerModel.profilePicImage = profilePicPath.value;
    reclaimerModel.eventPicImage = eventPicPath.value;
    var user = AuthenticationRepository.instance.getUser();
    reclaimerModel.loginUid = user?.uid;
    reclaimerModel.loginUserName = user?.displayName;
    reclaimerModel.loginUserEmail = user?.email;
    reclaimerModel.creationDate=DateTime.now().millisecondsSinceEpoch.toString();

    Map<FileType, File> imagesWithFiles = {};

    if (await addFileIfExist(reclaimerModel.aadharCardBackImage)) {
      reclaimerModel.aadharCardBackImage = await reclaimerRepository.uploadFile(
          FileType.AadharBack, File(reclaimerModel.aadharCardBackImage!));
    }
    if (await addFileIfExist(reclaimerModel.aadharCardFrontImage)) {
      reclaimerModel.aadharCardFrontImage =
          await reclaimerRepository.uploadFile(
              FileType.AadharFront, File(reclaimerModel.aadharCardFrontImage!));
    }

    if (await addFileIfExist(reclaimerModel.profilePicImage)) {
      reclaimerModel.profilePicImage = await reclaimerRepository.uploadFile(
          FileType.ProfilePic, File(reclaimerModel.profilePicImage!));
    }

    if (await addFileIfExist(reclaimerModel.eventPicImage)) {
      reclaimerModel.eventPicImage = await reclaimerRepository.uploadFile(
          FileType.EventPic, File(reclaimerModel.eventPicImage!));
    }

    /*  if (await addFileIfExist(reclaimerModel.profilePicImage)) {
      imagesWithFiles[FileType.ProfilePic] =
          File(reclaimerModel.profilePicImage!);
    }
    if (await addFileIfExist(reclaimerModel.eventPicImage)) {
      imagesWithFiles[FileType.EventPic] = File(reclaimerModel.eventPicImage!);
    }
    print("KEYS==>" + imagesWithFiles.keys.toString());
    Map<FileType, String> downloadFileList =
        await uploadImages(imagesWithFiles);

    print("KEYS==>" + downloadFileList.keys.toString());
    print("Values==>" + downloadFileList.values.toString());

    reclaimerModel.profilePicImage = downloadFileList[FileType.ProfilePic];
    reclaimerModel.eventPicImage = downloadFileList[FileType.EventPic];
    reclaimerModel.aadharCardFrontImage =
        downloadFileList[FileType.AadharFront];
    reclaimerModel.aadharCardBackImage = downloadFileList[FileType.AadharBack];*/

    await ReclaimerRepository.instance.createReclaimer(reclaimerModel);
    print(reclaimerModel.toJson());
  }

  void goToPage(int page) {
    controllerReclaimerForm.goToPage(page);
  }

  Future<bool> addFileIfExist(String? path) async {
    if (path != null) {
      var isFileExist = await File(path).exists();
      return isFileExist;
    } else {
      return false;
    }
  }

  Future<Map<FileType, String>> uploadImages(
      Map<FileType, File> imagesWithFiles) async {
    return await ReclaimerRepository.instance.uploadFiles(imagesWithFiles);
  }
}
