import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/text_with_icon_widget.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class ReclaimerFormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.find<DashboardController>();
    return Expanded(
      flex: 1,
      child: Center(
        child: TitleWithIconWidget(
          title: dashboardController.local.reclaimer_form,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
