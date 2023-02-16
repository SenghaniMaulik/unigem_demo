import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/common_text_form_field.dart';
import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';
import 'package:unigem_demo/src/features/authentication/controllers/signin_controller.dart';
import 'package:unigem_demo/src/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:unigem_demo/src/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:unigem_demo/src/features/authentication/screens/verify_your_mobile/verify_your_mobile_screen.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';
import 'package:unigem_demo/src/utils/validations.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "SignInScreen";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var appLocalization = AppLocalizations.of(context)!;

    final signInController = Get.put(SignInController());

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: addSideMargin(),
              alignment: Alignment.centerLeft,
              child: Text(
                appLocalization.sign_in,
                style: _textTheme.headline3?.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: WhiteTopRoundedBg(
              child: Padding(
                padding: addScreenPadding(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: addScreenPadding(),
                        shrinkWrap: true,
                        children: [
                          Text(
                            appLocalization.welcome,
                            style: _textTheme.headline4
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          addVerticalSpace(50),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CommonTextFormField(
                                  fieldType: TextFormFieldType.EMAIL,
                                  labelText: appLocalization.email,
                                  validation:
                                      Validations(context).getEmailValidation(),
                                  textEditingController: signInController.email,
                                ),
                                addVerticalSpace(20),
                                CommonTextFormField(
                                  fieldType: TextFormFieldType.PASSWORD,
                                  labelText: appLocalization.password,
                                  validation: Validations(context)
                                      .getPasswordValidation(),
                                  textEditingController:
                                      signInController.password,
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(20),
                          GestureDetector(
                            onTap: () {
                              Get.to(const ForgotPasswordScreen());
                            },
                            child: Text(
                              appLocalization.forgot_password_,
                              style: _textTheme.headline6?.copyWith(
                                  color: Colors.black54.withOpacity(0.5)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        BottomButton(
                          text: appLocalization.login,
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              signInController.signInUser(
                                  signInController.email.text.trim(),
                                  signInController.password.text.trim());
                            }
                          },
                        ),
                        addVerticalSpace(10),
                        RichText(
                            text: TextSpan(
                                text: appLocalization.dont_have_account,
                                style: Theme.of(context).textTheme.subtitle1,
                                children: [
                              TextSpan(
                                  text: " ${appLocalization.sign_up}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.off(const SignUpScreen());
                                    })
                            ])),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
