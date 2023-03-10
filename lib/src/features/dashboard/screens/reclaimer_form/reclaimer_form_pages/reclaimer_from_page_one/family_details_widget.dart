import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/models/child.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/child_list_widget.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class FamilyDetailWidget extends StatelessWidget {
  var controller = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(40),
        Text(
          controller.local.family_details,
          style: controller.textTheme.headline6
              ?.copyWith(fontFamily: '', fontWeight: FontWeight.w600),
        ),
        CommonTextReclaimerFormField(
          fieldType: TextFormFieldType.NUMBER,
          labelText: controller.local.family_members,
          validation: controller.validations.getNumberValidation(
              isRequired: false, field: controller.local.family_members),
          textEditingController: controller.familyCountController,
          isRequired: false,
        ),
        addVerticalSpace(40),
        ChildListWidget()
      ],
    );
  }
}


