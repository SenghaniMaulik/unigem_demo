import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class DashboardHeader extends StatelessWidget {
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: addSideMargin(),
            alignment: Alignment.centerLeft,
            child: Text(
              dashboardController.local.reclaimer,
              style: dashboardController.textTheme.headline3?.copyWith(
                  color: AppColor.white, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              child: const Icon(
                Icons.more_vert,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
