import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/text_with_icon_widget.dart';
import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

import 'reclaimer_form_pages/pager_indicator.dart';

class ReclaimerFormScreen extends StatelessWidget {
  const ReclaimerFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReclaimerFormController());
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: TitleWithIconWidget(
                  title: controller.local.reclaimer_form,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: WhiteTopRoundedBg(
                child: Column(
                  children: [
                    PagerIndicator(),
                    addVerticalSpace(5),
                    Expanded(
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (page) {
                          controller.currentPage.value = page;
                        },
                        children: controller.list,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
