import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/models/country.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class CountryPickerInputWidget extends StatelessWidget {
  var controller = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: false,
            // optional. Shows phone code before the country name.
            onSelect: (Country country) {
              print('Select country: ${country.displayNameNoCountryCode}');
              print('Select flagEmoji: ${country.flagEmoji}');
              print('Select countryCode: ${country.countryCode}');

              controller.countrySelected.value = CountrySelected(
                  name: country.displayNameNoCountryCode,
                  code: country.countryCode,
                  flag: country.flagEmoji);

              controller. countryNameController.text =
              "${country.flagEmoji}  ${country.displayNameNoCountryCode}";
            },
          );
        },
        child:

            TextFormField(
          style: controller.textTheme.headline6?.copyWith(
            color: AppColor.blackText,
            fontFamily: '',
          ),
          controller: controller.countryNameController,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            suffixIcon: Icon(Icons.arrow_drop_down),
            /*prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${controller.countrySelected.value!.flag}",
                  textAlign: TextAlign.center,
                  style: controller.textTheme.headline6,
                ),
              ],
            ),*/
            enabled: false,
            fillColor: Colors.white,
            contentPadding: addScreenPadding(padding: 10),
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
              borderSide: const BorderSide(
                  color: AppColor.grayTextFieldBorder, width: 2),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColor.secondaryColor, width: 2),
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
            floatingLabelAlignment: FloatingLabelAlignment.start,
            label: RichText(
              text: TextSpan(
                text: controller.local.country,
                style: controller.textTheme.headline6
                    ?.copyWith(color: AppColor.primaryColor),
                children: [
                  TextSpan(
                      text: "*",
                      style: controller.textTheme.headline6
                          ?.copyWith(color: Colors.red))
                ],
              ),
            ),
          ),
          onTap: () {},
        ));
  }
}
