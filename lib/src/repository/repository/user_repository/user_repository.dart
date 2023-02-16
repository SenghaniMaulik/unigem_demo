import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unigem_demo/src/features/authentication/models/user_model.dart';
import 'package:unigem_demo/src/utils/snack_bar.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  static const collectionUser = "Users";

  createUser(UserModel user) async {
    await _db
        .collection(collectionUser)
        .doc(user.email)
        .set(user.toJson())
        .whenComplete(() => () {
              KSnackBar.success(message: "Your account has been created");
            })
        .catchError((error, stakeTrace) {
      print('$error');
      KSnackBar.fail(message: "Something went wrong\n$error");
    });
  }

  Future<UserModel> getUserDetail(String email) async {
    final snapshot = await _db.collection(collectionUser).doc(email).get();
    return UserModel.fromSnapshot(snapshot);
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection(collectionUser).get();
    var userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  updateUserRecord(UserModel userModel) async {
    await _db
        .collection(collectionUser)
        .doc(userModel.id)
        .update(userModel.toJson());
  }

  getUserDetailStream(String email) {
    return _db.collection(collectionUser).doc(email).snapshots();
  }
}
