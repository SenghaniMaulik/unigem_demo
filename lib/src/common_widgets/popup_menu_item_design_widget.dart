import 'package:flutter/material.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class PopupMenuItemDesignWidget extends StatelessWidget {

  late IconData iconData;
  late String text;


  PopupMenuItemDesignWidget({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 20,
        ),
        addHorizontalSpace(10),
        Text(text)
      ],
    );
  }
}