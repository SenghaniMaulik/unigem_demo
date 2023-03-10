import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_two_controller.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/page_title.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_two/bank_details_widget.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_two/documents_details_widgets.dart';

class ReclaimerFormPageTwoScreen extends StatelessWidget {
  const ReclaimerFormPageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReclaimerFormPageTwoController());
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
                    stepText: controller.local.step_2,
                    titleText: controller.local.step_2_title),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 100),
                  child: Form(
                      key: controller.formKeyPageTwo,
                      child: Center(
                        child: Column(
                          children: [
                            BankDetailsWidget(),
                            DocumentDetailsWidgets(),
                          ],
                        ),
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
              if (controller.formKeyPageTwo.currentState?.validate() == true) {
               controller.validateAndUpdate();
              }
            },
          ),
        )
      ],
    );
  }
}




