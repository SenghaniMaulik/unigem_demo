import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/Utils.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:unigem_demo/src/features/dashboard/screens/dashboard/dashboard_body.dart';
import 'package:unigem_demo/src/features/dashboard/screens/dashboard/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final  dashboardController = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Column(
        children: [
          DashboardHeader(),
          DashboardBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          Utils.imagePath(filename: "ic_filter.svg"),
           height: 25,
          width: 25,
        ),
      ),
    );
  }
}
