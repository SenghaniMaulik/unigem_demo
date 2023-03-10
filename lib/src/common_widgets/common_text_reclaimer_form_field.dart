import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';

import '../constants/app_styles.dart';
import '../constants/constant.dart';
import '../utils/helper_widgets.dart';

class CommonTextReclaimerFormField extends StatefulWidget {
  CommonTextReclaimerFormField({
    required this.fieldType,
    required this.labelText,
    required this.validation,
    required this.textEditingController,
    this.isRequired = true,
  });

  late final TextFormFieldType fieldType;
  late String labelText;
  late String? Function(String?)? validation;
  late TextEditingController textEditingController;
  bool isRequired;

  @override
  State<CommonTextReclaimerFormField> createState() =>
      _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextReclaimerFormField> {
  late TextInputType textInputType;

  List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.singleLineFormatter
  ];
  late bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();

    switch (widget.fieldType) {
      case TextFormFieldType.PHONE:
        {
          textInputType = TextInputType.phone;
          inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
          inputFormatters.add(LengthLimitingTextInputFormatter(10));
        }
        break;

      case TextFormFieldType.EMAIL:
        {
          textInputType = TextInputType.emailAddress;
        }
        break;

      case TextFormFieldType.PASSWORD:
        {
          textInputType = TextInputType.visiblePassword;
        }
        break;

      case TextFormFieldType.NAME:
        {
          textInputType = TextInputType.name;
        }
        break;
      case TextFormFieldType.NUMBER:
        {
          textInputType = TextInputType.number;
        }
        break;

      case TextFormFieldType.SPINNER:
        {
          textInputType = TextInputType.name;
        }
        break;

      default:
        textInputType = TextInputType.text;
    }

    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style: controller.textTheme.headline6?.copyWith(
        color: AppColor.blackText,
        fontFamily: '',
      ),
      obscureText: widget.fieldType == TextFormFieldType.PASSWORD
          ? _passwordInVisible
          : false,
      validator: widget.validation,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          suffixIcon: widget.fieldType == TextFormFieldType.PASSWORD
              ? IconButton(
                  icon: Icon(
                    _passwordInVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
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
              : widget.fieldType == TextFormFieldType.SPINNER
                  ? Icon(
                      _passwordInVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      //change icon based on boolean value
                      color: AppColor.blackText,
                    )
                  : null,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 0,right: 0,top: 10,bottom: 10),
          labelStyle: controller.textTheme.headline5
              ?.copyWith(color: AppColor.primaryColor, fontFamily: ''),
          hintStyle: controller.textTheme.headline5
              ?.copyWith(color: AppColor.primaryColor, fontFamily: null),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.secondaryColor, width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.grayTextFieldBorder, width: 2),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.redLight, width: 2),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.secondaryColor, width: 2),
          ),
          // labelText: widget.labelText,
          hintText: '',
          label: RichText(
              text: TextSpan(
                  text: widget.labelText,
                  style: controller.textTheme.headline6
                      ?.copyWith(color: AppColor.primaryColor),
                  children: [
                TextSpan(
                    text: widget.isRequired ? "*" : "",
                    style: controller.textTheme.headline6
                        ?.copyWith(color: Colors.red))
              ]))),
    );
  }
}
