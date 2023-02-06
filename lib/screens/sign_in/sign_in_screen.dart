import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:unigem_demo/screens/verify_your_mobile/verify_your_mobile_screen.dart';
import 'package:unigem_demo/utils/app_styles.dart';
import 'package:unigem_demo/utils/helper_widgets.dart';
import 'package:unigem_demo/widgets/bottom_button.dart';

import '../../utils/constant.dart';
import '../../utils/validations.dart';
import '../../widgets/common_text_form_field.dart';
import '../../widgets/white_top_round_bg.dart';

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
    final mobileController = TextEditingController();
    final passwordController = TextEditingController();

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
                                    fieldType: TextFormFieldType.PHONE,
                                    labelText: appLocalization.mobile_number,
                                    validation: Validations(context).getPhoneValidation(),
                                    textEditingController: mobileController,
                                  ),
                                  addVerticalSpace(20),
                                  CommonTextFormField(
                                    fieldType: TextFormFieldType.PASSWORD,
                                    labelText: appLocalization.password,
                                    validation: Validations(context).getPasswordValidation(),
                                    textEditingController: passwordController,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    BottomButton(
                      text: appLocalization.login,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                         Navigator.pushNamed(context, VerifyYourMobileScreen.id);
                        }
                      },
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


