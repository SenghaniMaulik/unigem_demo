import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

import 'reclaimer_form_header.dart';

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
            ReclaimerFormHeader(),
            Expanded(
              flex: 9,
              child: WhiteTopRoundedBg(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    addVerticalSpace(10),
                    SizedBox(
                      height: 70,
                      child: Container(
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return PageIndicatorItem(itemPos: index);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.list.length,
                          clipBehavior: Clip.antiAlias,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: SizedBox(
                            height: 3,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return PageIndicatorItemBottom(itemPos: index);
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.list.length,
                            ),
                          ),
                        ),
                        Positioned(
                          left:0.0,
                          right:0.0,
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              height: 3,
                              color: AppColor.grayDarkText.withOpacity(0.1),
                            ),
                          ),
                        )
                      ],
                    ),

                    addVerticalSpace(10),
                    Expanded(
                      child: PageView(
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

class PageIndicatorItem extends StatelessWidget {
  final int itemPos;

  PageIndicatorItem({required this.itemPos});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();
    return Obx(() => Container(
          width: 35,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: controller.currentPage.value == itemPos
                  ? AppColor.primaryColor
                  : AppColor.white,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: AppColor.primaryColor,
                  spreadRadius: 2,
                ),
              ]),
          child: Center(
              child: Text(
            "${itemPos + 1}",
            style: controller.textTheme.subtitle1?.copyWith(
                color: controller.currentPage.value == itemPos
                    ? AppColor.white
                    : AppColor.primaryColor),
          )),
        ));
  }
}

class PageIndicatorItemBottom extends StatelessWidget {
  final int itemPos;

  PageIndicatorItemBottom({required this.itemPos});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();
    return Obx(() => Container(
          height: 3,
          width: 55,
          color: controller.currentPage.value == itemPos
              ? AppColor.primaryColor
              : AppColor.white,
        ));
  }
}
