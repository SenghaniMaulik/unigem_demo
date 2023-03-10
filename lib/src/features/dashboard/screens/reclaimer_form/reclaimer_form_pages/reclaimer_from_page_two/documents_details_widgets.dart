import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/common_widgets/upload_placeholder_with_file_select.dart';
import 'package:unigem_demo/src/common_widgets/yes_no_radio_widget.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_two_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

import '../../../../../../common_widgets/container_with_shadow_widget.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../../constants/constant.dart';

class DocumentDetailsWidgets extends StatelessWidget {
  final controller = Get.find<ReclaimerFormPageTwoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(30),
        Text(
          controller.local.document_Detail,
          style: controller.textTheme.headline6
              ?.copyWith(fontFamily: '', fontWeight: FontWeight.w600),
        ),
        addVerticalSpace(20),
        YesNoRadioWidget(
          label: controller.local.do_you_have_ration_card,
          widget: CommonTextReclaimerFormField(
            fieldType: TextFormFieldType.GENERAL,
            labelText: controller.local.ration_card_no,
            validation: controller.validations.getGeneralValidation(
                isRequired: true, field: controller.local.ration_card_no),
            textEditingController: controller.rationCardController,
            isRequired: true,
          ),
        ),
        YesNoRadioWidget(
          label: controller.local.do_you_have_voter_id_card,
          widget: CommonTextReclaimerFormField(
            fieldType: TextFormFieldType.GENERAL,
            labelText: controller.local.voter_id,
            validation: controller.validations.getGeneralValidation(
                isRequired: true, field: controller.local.voter_id),
            textEditingController: controller.voterIdCardController,
            isRequired: true,
          ),
        ),
        YesNoRadioWidget(
          label: controller.local.do_you_have_e_shram,
          widget: CommonTextReclaimerFormField(
            fieldType: TextFormFieldType.GENERAL,
            labelText: controller.local.e_sharam_card,
            validation: controller.validations.getGeneralValidation(
                isRequired: true, field: controller.local.e_sharam_card),
            textEditingController: controller.eShramCardController,
            isRequired: true,
          ),
        ),
        YesNoRadioWidget(
          label: controller.local.do_you_have_ayushman_card,
          widget: CommonTextReclaimerFormField(
            fieldType: TextFormFieldType.GENERAL,
            labelText: controller.local.ayushman_bhart_card,
            validation: controller.validations.getGeneralValidation(
                isRequired: true, field: controller.local.ayushman_bhart_card),
            textEditingController: controller.ayushmanCardController,
            isRequired: true,
          ),
        ),
        YesNoRadioWidget(
          label: controller.local.do_you_have_voter_id_card,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextReclaimerFormField(
                fieldType: TextFormFieldType.GENERAL,
                labelText: controller.local.aadhar_card,
                validation: controller.validations.getGeneralValidation(
                    isRequired: true, field: controller.local.aadhar_card),
                textEditingController: controller.aadharCardController,
                isRequired: true,
              ),
              UploadPlaceHolderWithFileSelectWidget(
                title: controller.local.upload_front_aadhar,
                path: controller.aadharCardFrontPath,
              ),
              UploadPlaceHolderWithFileSelectWidget(
                title: controller.local.upload_back_side_aadhar,
                path: controller.aadharCardBackPath,
              )
            ],
          ),
        ),
      ],
    );
  }
}


