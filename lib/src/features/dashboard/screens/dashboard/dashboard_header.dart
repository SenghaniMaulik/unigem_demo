import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/popup_menu_item_design_widget.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class DashboardHeader extends StatelessWidget {
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PopupMenuButtonState<int>> menuKey = GlobalKey();
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
            child: PopupMenuButton<int>(
              key: menuKey,
              icon: Icon(Icons.more_vert_outlined,color: AppColor.white,),
              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                  PopupMenuItem(
                    value: 0,
                    child: PopupMenuItemDesignWidget(
                      text: dashboardController.local.logout,
                      iconData: Icons.logout,
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                dashboardController.logout();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
