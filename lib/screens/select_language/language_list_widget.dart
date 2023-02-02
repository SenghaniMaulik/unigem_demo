import 'package:flutter/cupertino.dart';
import 'package:unigem_demo/screens/select_language/select_language_item_widget.dart';
import 'package:unigem_demo/widgets/no_glow_list_view.dart';

import '../../models/language_model.dart';

class LanguageList extends StatefulWidget {
  const LanguageList({Key? key}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {

  List<SelectLanguageModel> languageList = [
    SelectLanguageModel(title: "हिन्दी", subTitle: "नमस्ते", character: "क",isSelected: true),
    SelectLanguageModel(title: "English", subTitle: "Hello", character: "k"),
  ];
  int selectedItem=0;

  @override
  Widget build(BuildContext context) {
    return  ScrollConfiguration(
      behavior: NoGlow(),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SelectLanguageItemWidget(
            languageModel: languageList[index],onTap: () {
            setState(() {
              languageList[selectedItem].isSelected=false;
              selectedItem=index;
              languageList[index].isSelected=true;
            });
          },);
        },
        itemCount: languageList.length,
      ),
    );
  }
}
