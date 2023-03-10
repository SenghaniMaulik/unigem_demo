import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class InputWithDropdownWidget extends StatelessWidget {
  late String labelText;
  late String hintText;
  late TextEditingController textEditingController;
  late List<String> itemsList;

  InputWithDropdownWidget(
      {required this.labelText,
      required this.hintText,
      required this.textEditingController,
      required this.itemsList});

  var controller = Get.find<ReclaimerFormPageOneController>();
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dropdownButton =  DropdownButtonFormField2(
      style: controller.textTheme.headline6?.copyWith(
        color: AppColor.blackText,
        fontFamily: '',
      ),
      isExpanded: false,
      hint: Text(
        controller.local.please_select_(labelText.toLowerCase()),
        style: controller.textTheme.headline6?.copyWith(
          color: AppColor.grayText,
          fontFamily: '',
        ),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
      ),
      isDense: true,
      itemPadding: EdgeInsets.all(10),
      buttonPadding: const EdgeInsets.only(left: 0, right: 0),
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: addScreenPadding(padding: 10),
        labelStyle: controller.textTheme.headline5
            ?.copyWith(color: AppColor.primaryColor, fontFamily: ''),
        hintStyle: controller.textTheme.headline5
            ?.copyWith(color: AppColor.primaryColor, fontFamily: null),
        focusedBorder: UnderlineInputBorder(
          borderSide:
          const BorderSide(color: AppColor.secondaryColor, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          const BorderSide(color: AppColor.secondaryColor, width: 2),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          const BorderSide(color: AppColor.secondaryColor, width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.redLight, width: 2),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          const BorderSide(color: AppColor.secondaryColor, width: 2),
        ),
        // labelText: widget.labelText,
        hintText: '',
        floatingLabelAlignment: FloatingLabelAlignment.start,
        label: RichText(
          text: TextSpan(
            text: labelText,
            style: controller.textTheme.headline6
                ?.copyWith(color: AppColor.primaryColor),
            children: [
              TextSpan(
                  text: "*",
                  style: controller.textTheme.headline6
                      ?.copyWith(color: Colors.red))
            ],
          ),
        ),
      ),
      items: itemsList
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: controller.textTheme.headline6?.copyWith(
            color: AppColor.blackText,
            fontFamily: '',
          ),
          textAlign: TextAlign.center,
        ),
      ))
          .toList(),
      onChanged: (value) {
        print("$value");
        //Do something when changing the item if you want.
        // textEditingController.text = value.toString();
        textEditingController.text = value.toString();
      },
      onSaved: (value) {
      },
      searchController: searchTextEditingController,
      searchInnerWidgetHeight: 50,
      searchInnerWidget: Container(
        height: 50,
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 4,
          right: 8,
          left: 8,
        ),
        child: TextFormField(
          expands: true,
          maxLines: null,
          controller: searchTextEditingController,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            hintText: controller.local.search_for_an(labelText.toLowerCase()),
            hintStyle: const TextStyle(fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      searchMatchFn: (item, searchValue) {
        return (item.value.toString().contains(searchValue));
      },
      //This to clear the search value when you close the menu
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          searchTextEditingController.clear();
        }
      },
      validator: controller.validations
          .getGeneralValidation(field: labelText, isRequired: true),

    );
    return dropdownButton;
  }
}
