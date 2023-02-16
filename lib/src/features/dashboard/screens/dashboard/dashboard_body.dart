import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/white_top_round_bg.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_screen.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class DashboardBody extends StatelessWidget {
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: WhiteTopRoundedBg(
        child: Padding(
          padding: addScreenPadding(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   dashboardController.local.reclaimer_details,
                    style: dashboardController.textTheme.headline5,
                  ),
                  Container(
                      child: GestureDetector(
                        onTap: () => Get.to(const ReclaimerFormScreen()),
                        child: const Icon(
                          size: 30,
                          Icons.add_circle,
                          color: AppColor.primaryColor,
                        ),
                      ))
                ],
              ),
              Expanded(
                child: ListView(
                  padding: addScreenPadding(padding: 5),
                  shrinkWrap: true,
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
