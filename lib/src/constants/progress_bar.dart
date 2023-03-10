import 'package:flutter/material.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';

class AppProgress {
  late BuildContext context;

  AppProgress(this.context);

  showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(color: AppColor.primaryColor,),
          Container(
              margin: const EdgeInsets.only(left: 15), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
