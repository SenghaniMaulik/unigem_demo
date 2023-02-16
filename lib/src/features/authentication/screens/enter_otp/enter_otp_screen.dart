import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:unigem_demo/src/common_widgets/text_with_icon_widget.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';
import 'package:unigem_demo/src/common_widgets/Utils.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';


import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';

enum ComingFrom {
  SIGN_UP,
}

class EnterOTPScreen extends StatefulWidget {
  static const String id = "EnterOTPScreen";

  const EnterOTPScreen(
      {Key? key, this.comingFrom = ComingFrom.SIGN_UP, required this.mobile})
      : super(key: key);
  final ComingFrom comingFrom;
  final String mobile;

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
            child: Column(
              children: [
                TitleWithIconWidget(
                  title: appLocalization.enter_otp,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                addVerticalSpace(30),
                Flexible(child: SvgPicture.asset(Utils.imagePath(filename: "mobile_image.svg"))),
              ],
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
                            "${appLocalization.a_four_digit_code} ${widget.mobile}",
                            textAlign: TextAlign.center,
                            style: textTheme.headline5?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackText),
                          ),
                          addVerticalSpace(50),
                          PinInputWidget(formKey: _formKey),
                          addVerticalSpace(60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Utils.imagePath(filename: "loading_image.svg")),
                              addHorizontalSpace(10),
                              Text(appLocalization.auto_reading_otp)

                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        BottomButton(
                          text: appLocalization.verify_and_proceed,
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Your data is ${mobileController.text.toString()}')),
                              );
                            }
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: RichText(
                              text: TextSpan(
                                  text: appLocalization.dont_receive_code,
                                  style: textTheme.subtitle1,
                                  children: [
                                TextSpan(
                                    text: " ${appLocalization.resend}",
                                    style: textTheme.subtitle1?.copyWith(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.w700),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {})
                              ])),
                        )
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

class PinInputWidget extends StatefulWidget {

  PinInputWidget({required this.formKey});

  late final GlobalKey<FormState> formKey;

  @override
  State<PinInputWidget> createState() => _PinInputWidgetState();


}

class _PinInputWidgetState extends State<PinInputWidget> {

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColor.primaryColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = AppColor.secondaryColor;

    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.all(5),
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          /*TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
            },
            child: const Text('Validate'),
          ),*/
        ],
      ),
    );
  }
}

