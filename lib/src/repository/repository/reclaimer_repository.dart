import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/authentication/models/user_model.dart';
import 'package:unigem_demo/src/features/dashboard/models/ReclaimerModel.dart';
import 'package:unigem_demo/src/utils/snack_bar.dart';

class ReclaimerRepository extends GetxController {
  static ReclaimerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  static const collectionReclaimer = "Reclaimers";

  createReclaimer(ReclaimerModel reclaimer) async {
    await _db
        .collection(collectionReclaimer)
        .doc()
        .set(reclaimer.toJson())
        .whenComplete(() => () {
              KSnackBar.success(message: "Reclaimer created successfully");
            })
        .catchError((error, stakeTrace) {
      print('$error');
      KSnackBar.fail(message: "Something went wrong\n$error");
    });
  }

  Future<Map<FileType, String>> uploadFiles(Map<FileType, File> images) async {
    Map<FileType, String> imagesUrls = {};


   images.forEach((key, value) async {
      imagesUrls[key] = await uploadFile(key, value);
    });
    return imagesUrls;
  }

  Future<String> uploadFile(FileType key ,File image) async {
    String url = "";
    final metaData=SettableMetadata(contentType: "image/jpeg");
    final storageRef = FirebaseStorage.instance.ref();
    final Reference ref = storageRef.child("images/${key.name}_${DateTime.now().toString()}");
    final uploadTask=  ref.putFile(image,metaData);
    final taskSnapshot=await uploadTask.whenComplete(() => null);
    url=await taskSnapshot.ref.getDownloadURL();
    print(url);
    return url;
  }
}
