import 'package:flutter/material.dart';

import '../src/constants/app_styles.dart';

var _commonTextStyle =
const TextStyle(color: AppColor.blackText, );

const fontPoppins="Poppins";

TextTheme customTextTheme=TextTheme(
  //Original values
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5   (bodyText1)
  /// body2        14.0  regular  0.25  (bodyText2)
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5

  headline1: _commonTextStyle.copyWith(fontWeight: FontWeight.w400,fontFamily: fontPoppins,fontSize: 40),
  headline2: _commonTextStyle.copyWith( fontWeight: FontWeight.w400,fontFamily: fontPoppins,fontSize: 37),
  headline3: _commonTextStyle.copyWith( fontWeight: FontWeight.w400,fontFamily: fontPoppins,fontSize: 33),
  headline4: _commonTextStyle.copyWith( fontWeight: FontWeight.w400,fontFamily: fontPoppins,fontSize: 28),
  headline5: _commonTextStyle.copyWith( fontWeight: FontWeight.w400,fontFamily: fontPoppins),
  headline6: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
  subtitle1: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
  subtitle2: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
  bodyText1: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
  bodyText2: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
  button: _commonTextStyle.copyWith( fontWeight: FontWeight.w400,color: Colors.white,fontSize: 14),
  caption: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
  overline: _commonTextStyle.copyWith( fontWeight: FontWeight.w400),
);