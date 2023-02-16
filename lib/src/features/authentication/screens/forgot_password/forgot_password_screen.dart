import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/common_widgets/common_text_form_field.dart';
import 'package:unigem_demo/src/common_widgets/text_with_icon_widget.dart';
import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/authentication/controllers/forogt_password_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';
import 'package:unigem_demo/src/utils/snack_bar.dart';
import 'package:unigem_demo/src/utils/validations.dart';


class ForgotPasswordScreen extends StatefulWidget {
  static const String id = "ForgotPasswordScreen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    TextTheme _textTheme = Theme.of(context).textTheme;
    var appLocalization = AppLocalizations.of(context)!;


    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 5,
            child: TitleWithIconWidget(
              title: appLocalization.forgot_password,
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
                            appLocalization.enter_valid_email,
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
                                    fieldType: TextFormFieldType.EMAIL,
                                    labelText: appLocalization.email,
                                    validation: Validations(context)
                                        .getEmailValidation(),
                                    textEditingController: controller.email,
                                  ),
                                  addVerticalSpace(20),
                                ],
                              ))
                        ],
                      ),
                    ),
                    BottomButton(
                      text: appLocalization.submit,
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                         await controller.resetPassword();
                         KSnackBar.success(message: appLocalization.reset_password_msg);
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


