import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:unigem_demo/utils/app_styles.dart';
import 'package:unigem_demo/utils/helper_widgets.dart';
import 'package:unigem_demo/widgets/bottom_button.dart';

import '../../utils/constant.dart';
import '../../utils/validations.dart';
import '../../widgets/common_text_form_field.dart';
import '../../widgets/text_with_icon_widget.dart';
import '../../widgets/white_top_round_bg.dart';
import '../enter_otp/enter_otp_screen.dart';

class VerifyYourMobileScreen extends StatefulWidget {
  static const String id = "VerifyYourMobileScreen";

  const VerifyYourMobileScreen({Key? key}) : super(key: key);

  @override
  State<VerifyYourMobileScreen> createState() => _VerifyYourMobileScreenState();
}

class _VerifyYourMobileScreenState extends State<VerifyYourMobileScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var appLocalization = AppLocalizations.of(context)!;
    final mobileController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 5,
            child: TitleWithIconWidget(
              title: appLocalization.verify_your_mobile_num,
              onTap: () {
                Navigator.pop(context);
              },
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
                            appLocalization.enter_your_registered_mobile_number,
                            style: _textTheme.headline5?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackText),
                          ),
                          addVerticalSpace(50),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CommonTextFormField(
                                    fieldType: TextFormFieldType.PHONE,
                                    labelText: appLocalization.mobile_number,
                                    validation: Validations(context)
                                        .getPhoneValidation(),
                                    textEditingController: mobileController,
                                  ),
                                  addVerticalSpace(20),
                                ],
                              ))
                        ],
                      ),
                    ),
                    BottomButton(
                      text: appLocalization.send_otp,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                        Navigator.pushNamed(context, EnterOTPScreen.id);
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


