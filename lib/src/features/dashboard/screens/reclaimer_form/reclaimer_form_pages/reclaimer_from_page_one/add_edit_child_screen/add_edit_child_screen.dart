import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button_outlined.dart';
import 'package:unigem_demo/src/common_widgets/common_text_reclaimer_form_field.dart';
import 'package:unigem_demo/src/common_widgets/yes_no_radio_widget.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/add_edit_child_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/models/child.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/input_with_dropdown_widget.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class AddEditChildScreen extends StatelessWidget {
  Child? child;
 int pos;

  AddEditChildScreen({this.child, this.pos=0});

  var controllerPageOne = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddEditChildController());
    var isAdd = child == null;

    if(child!=null){
      controller.ageController.text=child!.age;
      controller.schoolingController.text=child!.schooling;
      controller.fullNameController.text=child!.fullName;
      controller.genderController.text=child!.gender;
    }
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isAdd
                        ? controller.local.add_child_details
                        : controller.local.edit_child_details,
                    style: controller.textTheme.headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close_sharp,
                      color: AppColor.grayText,
                    ),
                  )
                ],
              ),
              CommonTextReclaimerFormField(
                fieldType: TextFormFieldType.NAME,
                labelText: controller.local.full_name,
                validation: controller.validations
                    .getNameValidation(field: controller.local.full_name),
                textEditingController: controller.fullNameController,
              ),
              InputWithDropdownWidget(
                  labelText: controller.local.gender,
                  hintText:
                      controller.local.please_select_(controller.local.gender),
                  textEditingController: controller.genderController,
                  itemsList: controller.genderItems),
              YesNoRadioWidget(
                label: controller.local.schooling,
                widget: CommonTextReclaimerFormField(
                  fieldType: TextFormFieldType.NUMBER,
                  labelText: controller.local.schooling,
                  validation: controller.validations.getNumberValidation(
                      field: controller.local.schooling,
                      length: 3,
                      isRequired: controller.schoolingVisible.value ==
                          InputVisibility.Yes.name),
                  textEditingController: controller.schoolingController,
                  isRequired: controller.schoolingVisible.value ==
                      InputVisibility.Yes.name,
                ),
              ),
              CommonTextReclaimerFormField(
                fieldType: TextFormFieldType.NUMBER,
                labelText: controller.local.age,
                validation: controller.validations.getNumberValidation(
                    field: controller.local.age, length: 3),
                textEditingController: controller.ageController,
              ),
              addVerticalSpace(50),
              Row(
                children: [
                  Flexible(
                    child: BottomButtonOutlined(
                      text: controller.local.reset,
                      onPressed: () {
                        controller.resetData();
                      },
                    ),
                  ),
                  Flexible(
                    child: BottomButton(
                      text:  isAdd
                          ? controller.local.save_details
                          : controller.local.update_detail,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          if (isAdd) {
                            controllerPageOne.addChild(Child(
                                fullName:
                                    controller.fullNameController.text.trim(),
                                gender: controller.genderController.text.trim(),
                                schooling:
                                    controller.schoolingController.text.trim(),
                                age: controller.ageController.text.trim()));
                          } else {
                            controllerPageOne.editChild(
                                Child(
                                    fullName: controller.fullNameController.text
                                        .trim(),
                                    gender:
                                        controller.genderController.text.trim(),
                                    schooling: controller
                                        .schoolingController.text
                                        .trim(),
                                    age: controller.ageController.text.trim()),
                                pos);
                          }

                          Get.back();
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


