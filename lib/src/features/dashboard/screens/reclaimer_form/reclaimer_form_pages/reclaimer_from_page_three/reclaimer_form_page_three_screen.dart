import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/bottom_button.dart';
import 'package:unigem_demo/src/common_widgets/upload_placeholder_with_file_select.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_three_controller.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/page_title.dart';

class ReclaimerFormPageThreeScreen extends StatelessWidget {
  const ReclaimerFormPageThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReclaimerFormPageThreeController());
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
                    stepText: controller.local.step_3,
                    titleText: controller.local.step_3_title),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 100),
                  child: Form(
                      child: Center(
                        child: Column(
                          children: [
                            UploadPlaceHolderWithFileSelectWidget(
                              title: controller.local.profile_pic,
                              path: controller.profilePicPath,
                            ),
                            UploadPlaceHolderWithFileSelectWidget(
                              title: controller.local.event_picture,
                              path: controller.eventPicPath,
                            ),
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
            onPressed: () async {
              await controller.validateAllData(context);
            },
          ),
        )
      ],
    );
  }
}
