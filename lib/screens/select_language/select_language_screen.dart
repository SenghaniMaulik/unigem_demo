import 'package:flutter/material.dart';
import 'package:unigem_demo/models/language_model.dart';
import 'package:unigem_demo/screens/select_language/select_language_item_widget.dart';
import 'package:unigem_demo/utils/app_styles.dart';
import 'package:unigem_demo/utils/helper_widgets.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: addScreenPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: AppLayout.height(30)),
                          child: Text(
                            "Select a\nLanguage",
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
                            const LanguageBubble(
                              text: "Baler",
                              isEn: true,
                            ),
                            addVerticalSpace(15),
                            const LanguageBubble(
                              text: "बेलर",
                              isEn: false,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(50),
                  const LanguageList(),
                ],
              ),

              BottomButton(
                text: "Next",
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
