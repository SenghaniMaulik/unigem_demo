import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unigem_demo/screens/sign_in/sign_in_screen.dart';

import 'package:unigem_demo/utils/helper_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../locale/LanguageProvider.dart';
import '../../utils/preferance_helper.dart';
import '../../widgets/bottom_button.dart';
import 'language_bubble_widget.dart';
import 'language_list_widget.dart';

class SelectLanguageScreen extends StatefulWidget {
  static const String id = "SelectLanguageScreen";


  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();

}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {



  @override
  Widget build(BuildContext context) {

    TextTheme _textTheme = Theme.of(context).textTheme;
    var appLocalization = AppLocalizations.of(context)!;
    Localizations.localeOf(context);
    // Provider.of<LanguageProvider>(context,listen: false).changeLocale(SharedHelper.getData(SharedHelper.keyLanguage).toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: addScreenPadding(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child:
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: AppLayout.height(200),
                                padding: EdgeInsets.symmetric(
                                    vertical: AppLayout.height(30)),
                                child: Text(
                                  appLocalization.select_a_language,
                                  style: _textTheme.headline5?.copyWith(
                                      fontWeight: FontWeight.w400, fontSize: 30),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LanguageBubble(
                                    text: appLocalization.appName,
                                    isEn: true,
                                  ),
                                  addVerticalSpace(15),
                                  const LanguageBubble(
                                    text: 'बेलर',
                                    isEn: false,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const LanguageList(),
                      ],
                    ),

                ),
              ),
              BottomButton(
                text: appLocalization.next,
                onPressed: () {
                  print(Localizations.localeOf(context));
                  PreferenceHelper.saveData(PreferenceHelper.keyLanguage, Localizations.localeOf(context).toString());
                  Navigator.pushNamed(context, SignInScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
