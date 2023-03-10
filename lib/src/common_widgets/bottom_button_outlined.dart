import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class BottomButtonOutlined extends StatelessWidget {
  BottomButtonOutlined({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          fixedSize: Size(double.infinity, 50),
          padding: EdgeInsets.all(14),
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              width: 2,
              color: AppColor.primaryColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(fontSize: 19, color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
