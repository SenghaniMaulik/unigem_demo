import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigem_demo/src/exceptions/login_with_email_and_pssword_failure.dart';
import 'package:unigem_demo/src/exceptions/signup_email_password_failure.dart';
import 'package:unigem_demo/src/features/authentication/screens/select_language/select_language_screen.dart';
import 'package:unigem_demo/src/features/authentication/screens/sign_in/sign_in_screen.dart';
import 'package:unigem_demo/src/features/dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:unigem_demo/src/utils/preferance_helper.dart';
import 'package:unigem_demo/src/utils/snack_bar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      var isFirstTimeUserOpenApp =
          await PreferenceHelper.getBool(PreferenceHelper.keyIsFirstTime);
      if (!isFirstTimeUserOpenApp) {
        Get.offAll(SelectLanguageScreen());
      } else {
        Get.offAll(const SignInScreen());
      }
    } else {
      Get.offAll(const DashboardScreen());
    }
  }

  createUserWithEmailAndPassword(
      String email, String password, String fullName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _auth.currentUser?.updateDisplayName(fullName);
      _setInitialScreen(firebaseUser.value);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.getMessageFromErrorCode(
          errorCode: e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex}");
      KSnackBar.fail(message: ex.toString());
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure.getMessageFromErrorCode();
      print("EXCEPTION - ${ex}");
      KSnackBar.fail(message: ex.toString());
    }
  }

  signInUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _setInitialScreen(firebaseUser.value);
    } on FirebaseAuthException catch (e) {
      final ex =
          SignInWithEmailAndPasswordFailure.getMessageFromErrorCode(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex}");
      KSnackBar.fail(message: ex.toString());
    } catch (_) {
      final ex = SignInWithEmailAndPasswordFailure.getMessageFromErrorCode("");
      print("EXCEPTION - ${ex}");
      KSnackBar.fail(message: ex.toString());
    }
  }

 User? getUser()  =>  firebaseUser.value;

  Future<void> logout() async => await _auth.signOut();

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          KSnackBar.fail(message: "The provided number is not valid");
        } else {
          KSnackBar.fail(message: "Something went wrong .Try again");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email).catchError((e) {
      KSnackBar.fail(
          message:
              e.toString());
    });
  }
}
