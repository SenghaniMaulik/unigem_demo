import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class PagerIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();
    return Column(
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
              left: 0.0,
              right: 0.0,
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
      ],
    );
  }
}

class PageIndicatorItem extends StatelessWidget {
  final int itemPos;

  PageIndicatorItem({required this.itemPos});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();
    return Obx(() => GestureDetector(
          onTap: () => controller.goToPage(itemPos),
          child: Container(
            width: 55,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: controller.currentPage.value >= itemPos
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
                  fontSize: 19,
                  color: controller.currentPage.value >= itemPos
                      ? AppColor.white
                      : AppColor.primaryColor,
                  fontWeight: FontWeight.w600),
            )),
          ),
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
          margin: EdgeInsets.symmetric(horizontal: 15),
          color: controller.currentPage.value == itemPos
              ? AppColor.primaryColor
              : AppColor.white,
        ));
  }
}
