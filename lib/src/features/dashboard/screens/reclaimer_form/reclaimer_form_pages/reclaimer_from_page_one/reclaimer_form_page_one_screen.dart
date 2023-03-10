import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/basic_info_widget.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/family_details_widget.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/other_info_widget.dart';

import '../page_title.dart';

class ReclaimerFormPageOneScreen extends StatelessWidget {
  const ReclaimerFormPageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReclaimerFormPageOneController());
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PageTitle(
                    stepText: controller.local.step_1,
                    titleText: controller.local.step_1_title),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 100),
                  child: Form(
                      key: controller.formKeyPageOne,
                      child: Column(
                        children: [
                          BasicInfoWidget(),
                          FamilyDetailWidget(),
                          OtherDetailWidget()
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: BottomButton(
            text: controller.local.save_and_next,
            onPressed: () {
              controller.validateAndUpdate();
            },
          ),
        )
      ],
    );
  }
}
