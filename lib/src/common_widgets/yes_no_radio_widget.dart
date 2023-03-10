import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/constants/constant.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/add_edit_child_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class YesNoRadioWidget extends StatelessWidget {
  YesNoRadioWidget({required this.label, required this.widget,this.isRequired=true});

  late Widget widget;
  late String label;
  late bool isRequired;
  RxString isVisible = InputVisibility.Yes.name.obs;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();
    return Obx(() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: RichText(
                      text: TextSpan(
                          text: label,
                          style: controller.textTheme.subtitle2
                              ?.copyWith(color: AppColor.primaryColor),
                          children: [
                            TextSpan(
                                text: isRequired ? "*" : "",
                                style: controller.textTheme.subtitle2
                                    ?.copyWith(color: Colors.red))
                          ])),
                ),
                Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColor.primaryColor),
                          value: InputVisibility.Yes.name.toString(),
                          groupValue: isVisible.value.toString(),
                          onChanged: (value) {
                            isVisible.value = value!;
                          },
                        ),
                        Text(controller.local.yes),
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColor.primaryColor),
                          value: InputVisibility.No.name.toString(),
                          groupValue: isVisible.value.toString(),
                          onChanged: (value) {
                            isVisible.value = value!;
                          },
                        ),
                        Text(controller.local.no),
                        addHorizontalSpace(10),
                      ],
                    )),
              ],
            ),
            Visibility(
              visible: isVisible.value == InputVisibility.Yes.name,
              child: widget,
            )
          ],
        ));
  }
}
