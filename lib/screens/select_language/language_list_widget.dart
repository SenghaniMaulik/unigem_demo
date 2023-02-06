import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unigem_demo/locale/LanguageProvider.dart';
import 'package:unigem_demo/locale/language.dart';
import 'package:unigem_demo/screens/select_language/select_language_item_widget.dart';
import 'package:unigem_demo/widgets/no_glow_list_view.dart';

import '../../models/language_model.dart';
import '../../utils/preferance_helper.dart';

class LanguageList extends StatefulWidget {
  const LanguageList({Key? key}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  List<SelectLanguageModel> languageList = [
    SelectLanguageModel(
      title: "English",
      subTitle: "Hello",
      character: "k",
      code: Language.english,
    ),
    SelectLanguageModel(
        title: "हिन्दी",
        subTitle: "नमस्ते",
        code: Language.hindi,
        character: "क"),
  ];
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    getAndSetPreviouslySelectedLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlow(),
      child: ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SelectLanguageItemWidget(
            languageModel: languageList[index],
            onTap: () {
              setState(() {
                languageList[selectedItem].isSelected = false;
                selectedItem = index;
                languageList[index].isSelected = true;
                Provider.of<LanguageProvider>(context, listen: false)
                    .changeLocale(languageList[index].code);
              });
            },
          );
        },
        itemCount: languageList.length,
      ),
    );
  }

  Future<void> getAndSetPreviouslySelectedLanguage() async {
    String currentLan= await PreferenceHelper.getData(PreferenceHelper.keyLanguage);
    languageList.asMap().forEach((index, value) {
      print('${value.code}==$currentLan');
      if (value.code ==
          currentLan) {
        print('${value.code}==$currentLan');
        selectedItem = index;
        value.isSelected = true;
        Provider.of<LanguageProvider>(context, listen: false)
            .changeLocale(value.code);
      }
    });
  }
}
