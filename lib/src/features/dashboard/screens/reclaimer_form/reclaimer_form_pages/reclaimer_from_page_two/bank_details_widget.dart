import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/common_widgets/yes_no_radio_widget.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_two_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class BankDetailsWidget extends StatelessWidget {


  final controller = Get.find<ReclaimerFormPageTwoController>();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.local.bank_details,
          style: controller.textTheme.headline6?.copyWith(
              fontFamily: '', fontWeight: FontWeight.w600),
        ),
        addVerticalSpace(30),
        YesNoRadioWidget(
          label: controller.local.do_you_have_bank_ac,
          widget: Column(
            children: [
              CommonTextReclaimerFormField(
                fieldType: TextFormFieldType.NAME,
                labelText: controller.local.bank_name,
                validation: controller.validations
                    .getNameValidation(
                    isRequired: true,
                    field: controller.local.bank_name),
                textEditingController:
                controller.bankNameController,
                isRequired: true,
              ),
              CommonTextReclaimerFormField(
                fieldType: TextFormFieldType.NUMBER,
                labelText: controller.local.account_no,
                validation: controller.validations
                    .getNumberValidation(
                    length: 16,
                    isRequired: true,
                    field: controller.local.account_no),
                textEditingController:
                controller.accountNoController,
                isRequired: true,
              ),
              CommonTextReclaimerFormField(
                fieldType: TextFormFieldType.GENERAL,
                labelText: controller.local.ifsc_code,
                validation: controller.validations
                    .getNumberValidation(
                    length: 16,
                    isRequired: true,
                    field: controller.local.ifsc_code),
                textEditingController:
                controller.ifscCodeController,
                isRequired: true,
              )
            ],
          ),
        ),
      ],
    );
  }
}