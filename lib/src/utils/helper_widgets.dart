import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget addVerticalSpace(double height){
  return SizedBox(
    height: AppLayout.height(height),
  );
}

Widget addHorizontalSpace(double width){
  return SizedBox(
    width: AppLayout.width(width),
  );
}

EdgeInsetsGeometry addScreenPadding({double padding=15}){
  return EdgeInsets.all(padding);
}

EdgeInsetsGeometry addSideMargin({double margin=15}){
  return EdgeInsets.all(margin);
}

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  static getScreenHeight() {
    return Get.height;
  }
  static getScreenHeightByRatio() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }
  static getScreenWidthByRatio() {
    return Get.width;
  }

  static height(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static width(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }


}

