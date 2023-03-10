import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/country_picker_input_widget.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/input_with_dropdown_widget.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class OtherDetailWidget extends StatelessWidget {
  var controller = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(40),
        Text(
          controller.local.other_details,
          style: controller.textTheme.headline6
              ?.copyWith(fontFamily: '', fontWeight: FontWeight.w600),
        ),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.NUMBER,
          labelText: controller.local.capacity_per_Day,
          validation: controller.validations.getNumberValidation(
              isRequired: true, field: controller.local.capacity_per_Day),
          textEditingController: controller.capacityPerDayController,
          isRequired: true,
        ),
        addVerticalSpace(10),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.GENERAL,
          labelText: controller.local.small_scrap_dealer,
          validation: controller.validations.getGeneralValidation(
              isRequired: true, field: controller.local.small_scrap_dealer),
          textEditingController: controller.smallScrapDealerNameController,
          isRequired: true,
        ),
        addVerticalSpace(10),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.GENERAL,
          labelText: controller.local.collection_center,
          validation: controller.validations.getGeneralValidation(
              isRequired: true, field: controller.local.collection_center),
          textEditingController: controller.collectionCenterController,
          isRequired: true,
        ),
        addVerticalSpace(10),
        CountryPickerInputWidget(),
        addVerticalSpace(10),
        InputWithDropdownWidget(
          labelText: controller.local.state,
          hintText: controller.local.state,
          textEditingController: controller.stateController,
          itemsList: controller.stateItems,
        ),
        addVerticalSpace(10),
        InputWithDropdownWidget(
          labelText: controller.local.district,
          hintText: controller.local.district,
          textEditingController: controller.districtController,
          itemsList: controller.districtItems,
        ),
        addVerticalSpace(10),
        InputWithDropdownWidget(
          labelText: controller.local.city,
          hintText: controller.local.city,
          textEditingController: controller.cityController,
          itemsList: controller.cityItems,
        ),
        addVerticalSpace(10),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.NUMBER,
          labelText: controller.local.pin_code,
          validation: controller.validations.getNumberValidation(
              isRequired: true, field: controller.local.pin_code),
          textEditingController: controller.pinCodeController,
          isRequired: true,
        ),
        addVerticalSpace(10),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.GENERAL,
          labelText: controller.local.material_provided,
          validation: controller.validations.getGeneralValidation(
              isRequired: true, field: controller.local.material_provided),
          textEditingController: controller.materialProvidedController,
          isRequired: true,
        )
      ],
    );
  }
}
