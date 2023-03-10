import 'package:flutter/material.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class ContainerWithShadowWidget extends StatelessWidget {

  final Widget widget;
  final double padding;

  const ContainerWithShadowWidget({required this.widget,this.padding=15});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: addScreenPadding(padding: padding),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), //border corner radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 2), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: widget,
    );
  }
}