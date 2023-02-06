import 'package:flutter/cupertino.dart';

import '../utils/app_styles.dart';

class WhiteTopRoundedBg extends StatelessWidget {

  WhiteTopRoundedBg({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: child);
  }


}