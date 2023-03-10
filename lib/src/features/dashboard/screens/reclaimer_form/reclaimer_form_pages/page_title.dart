import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_controller.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.stepText,
    required this.titleText,
  });

  final String stepText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReclaimerFormController>();
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
        bottom: 20,
      ),
      child: RichText(
          text: TextSpan(
              text:stepText,
              style: controller.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColor.primaryColor),
              children: [
            TextSpan(
                text:titleText,
                style: controller.textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColor.blackText))
          ])),
    );
  }
}
