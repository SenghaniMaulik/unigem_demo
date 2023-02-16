import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/common_widgets/common_text_form_field.dart';
import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/authentication/controllers/signup_controller.dart';
import 'package:unigem_demo/src/features/authentication/models/user_model.dart';
import 'package:unigem_demo/src/features/authentication/screens/sign_in/sign_in_screen.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';
import 'package:unigem_demo/src/utils/validations.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "SignInScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var appLocalization = AppLocalizations.of(context)!;

    final controller = Get.put(SignUpController());
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
                appLocalization.sign_up,
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
                          addVerticalSpace(50),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CommonTextFormField(
                                    fieldType: TextFormFieldType.EMAIL,
                                    labelText: appLocalization.email,
                                    validation: Validations(context)
                                        .getEmailValidation(),
                                    textEditingController: controller.email,
                                  ),
                                  addVerticalSpace(20),
                                  CommonTextFormField(
                                    fieldType: TextFormFieldType.PASSWORD,
                                    labelText: appLocalization.password,
                                    validation: Validations(context)
                                        .getPasswordValidation(),
                                    textEditingController: controller.password,
                                  ),
                                  addVerticalSpace(20),
                                  CommonTextFormField(
                                    fieldType: TextFormFieldType.PHONE,
                                    labelText: appLocalization.mobile_number,
                                    validation: Validations(context)
                                        .getPhoneValidation(),
                                    textEditingController: controller.phoneNo,
                                  ),
                                  addVerticalSpace(20),
                                  CommonTextFormField(
                                    fieldType: TextFormFieldType.NAME,
                                    labelText: appLocalization.full_name,
                                    validation: Validations(context)
                                        .getNameValidation(),
                                    textEditingController: controller.fullName,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        BottomButton(
                          text: appLocalization.register,
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              final user = UserModel(
                                  fullName: controller.fullName.text.trim(),
                                  email: controller.email.text.trim(),
                                  phoneNo: controller.phoneNo.text.trim(),
                                  password: controller.password.text.trim());
                              controller.registerUser(user);
                            }
                          },
                        ),
                        addVerticalSpace(10),
                        RichText(
                            text: TextSpan(
                                text: appLocalization.already_registered,
                                style: Theme.of(context).textTheme.subtitle1,
                                children: [
                              TextSpan(
                                  text: " ${appLocalization.sign_in}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.off(const SignInScreen());
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
