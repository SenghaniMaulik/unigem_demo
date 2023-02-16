import 'package:flutter/material.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';



class LanguageBubble extends StatelessWidget {
  final String text;
  final bool isEn;

  const LanguageBubble({required this.text, required this.isEn});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isEn ? EdgeInsets.only(right: AppLayout.height(50)) : EdgeInsets
          .only(left: AppLayout.height(50)),
      padding: EdgeInsets.all(AppLayout.height(12)),
      width: AppLayout.width(130),
      decoration: BoxDecoration(
          color: isEn ? AppColor.bubbleEng : AppColor.bubbleHin,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(isEn ? 8 : 0),
              bottomLeft: Radius.circular(isEn ? 0 : 8))),
      alignment: Alignment.center,
      child: Text(
        text,
        style: Theme
            .of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}