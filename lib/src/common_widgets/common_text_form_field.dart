import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_styles.dart';
import '../constants/constant.dart';
import '../utils/helper_widgets.dart';

class CommonTextFormField extends StatefulWidget {
  CommonTextFormField(
      {required this.fieldType,
      required this.labelText,
      required this.validation,
      required this.textEditingController});

  late final TextFormFieldType fieldType;
  late String labelText;
  late String? Function(String?)? validation;
  late TextEditingController textEditingController ;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late TextInputType textInputType;

  late IconData iconData;

  List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.singleLineFormatter
  ];
  late bool _passwordInVisible=true ;
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    switch (widget.fieldType) {
      case TextFormFieldType.PHONE:
        {
          textInputType = TextInputType.phone;
          inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
          inputFormatters.add(LengthLimitingTextInputFormatter(10));
          iconData = Icons.call;
        }
        break;

      case TextFormFieldType.EMAIL:
        {
          textInputType = TextInputType.emailAddress;
          iconData = Icons.email;
        }
        break;

      case TextFormFieldType.PASSWORD:
        {
          textInputType = TextInputType.visiblePassword;
          iconData = Icons.lock;
        }
        break;

      case TextFormFieldType.NAME:
        {
          textInputType = TextInputType.name;
          iconData = Icons.person;
        }
        break;
      default:
        textInputType = TextInputType.text;
    }

    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style: _textTheme.headline6?.copyWith(
        color: AppColor.blackText,
        fontFamily: '',

      ),
      obscureText:widget.fieldType == TextFormFieldType.PASSWORD?_passwordInVisible:false,
      validator: widget.validation,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        suffixIcon: widget.fieldType == TextFormFieldType.PASSWORD
            ? IconButton(
                icon: Icon(
                  _passwordInVisible ? Icons.visibility_off : Icons.visibility,
                  //change icon based on boolean value
                  color: AppColor.blackText,
                ),
                onPressed: () {
                  setState(() {
                    _passwordInVisible =
                        !_passwordInVisible; //change boolean value
                  });
                },
              )
            : null,
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(iconData, color: AppColor.blackText),
        ),
        fillColor: Colors.white,
        contentPadding: addScreenPadding(padding: 16),
        labelStyle: _textTheme.headline5
            ?.copyWith(color: AppColor.grayText, fontFamily: ''),
        hintStyle: _textTheme.headline5
            ?.copyWith(color: AppColor.primaryColor, fontFamily: null),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.secondaryColor, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: AppColor.grayTextFieldBorder, width: 2)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.redLight, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColor.secondaryColor, width: 2),
        ),
        labelText: widget.labelText,
        hintText: '',
      ),
    );
  }
}
