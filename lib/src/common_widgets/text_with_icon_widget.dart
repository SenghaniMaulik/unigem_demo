import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../utils/helper_widgets.dart';

class TitleWithIconWidget extends StatelessWidget {
  const TitleWithIconWidget({super.key, required this.title, required this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: addSideMargin(),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: true,
            child: Flexible(
              flex: 4,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: const EdgeInsets.only(top: 5, right: 22),
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0x80ffffff)),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColor.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Text(
              title,
              overflow: TextOverflow.fade,
              style: textTheme.headline4?.copyWith(
                  color: AppColor.white, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}