import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class BasicInfoWidget extends StatelessWidget {
  var controller = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.NAME,
          labelText: controller.local.reclaimer_full_name,
          validation: controller.validations
              .getNameValidation(field: controller.local.reclaimer_full_name),
          textEditingController: controller.fullNameController,
        ),
        addVerticalSpace(10),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.PHONE,
          labelText: controller.local.primary_mobile_no,
          validation:
          controller.validations.getPhoneValidation(isRequired: false),
          textEditingController: controller.primaryMobileController,
          isRequired: false,
        ),
        addVerticalSpace(10),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.EMAIL,
          labelText: controller.local.email_id,
          validation:
          controller.validations.getEmailValidation(isRequired: false),
          textEditingController: controller.emailIdController,
          isRequired: false,
        ),
      ],
    );
  }
}