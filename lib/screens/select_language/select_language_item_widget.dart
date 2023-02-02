import 'package:flutter/material.dart';

import '../../models/language_model.dart';
import '../../utils/app_styles.dart';
import '../../utils/helper_widgets.dart';

class SelectLanguageItemWidget extends StatelessWidget {
  SelectLanguageItemWidget({required this.languageModel,required this.onTap});
  late SelectLanguageModel languageModel;
  late VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    var textColor =
    languageModel.isSelected ? AppColor.white : AppColor.primaryColor;
    var backgroundColor =
    languageModel.isSelected ? AppColor.primaryColor : AppColor.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppLayout.height(30)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.height(10)),
            boxShadow: [
              BoxShadow(
                  color: AppColor.grayShadow, blurRadius: 5, spreadRadius: 8)
            ]),
        child: Container(

          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppLayout.height(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageModel.title,
                        style: textTheme.headline5?.copyWith(color: textColor),
                      ),
                      addVerticalSpace(10),
                      Text(
                        languageModel.subTitle,
                        style: textTheme.subtitle1?.copyWith(color: textColor,fontWeight: FontWeight.w300),
                      )

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    languageModel.character,
                    style: textTheme.headline2?.copyWith(
                      color: languageModel.isSelected
                          ? textColor
                          : AppColor.bubbleEng,
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}