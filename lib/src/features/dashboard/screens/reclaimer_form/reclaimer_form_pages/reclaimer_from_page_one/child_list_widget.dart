import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigem_demo/src/common_widgets/container_with_shadow_widget.dart';
import 'package:unigem_demo/src/common_widgets/popup_menu_item_design_widget.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/features/dashboard/controllers/reclaimer_form_page_one_controller.dart';
import 'package:unigem_demo/src/features/dashboard/models/child.dart';
import 'package:unigem_demo/src/features/dashboard/screens/reclaimer_form/reclaimer_form_pages/reclaimer_from_page_one/add_edit_child_screen/add_edit_child_screen.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';

class ChildListWidget extends StatelessWidget {
  var controller = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.childList.isEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.local.child_details,
                style: controller.textTheme.headline6
                    ?.copyWith(fontFamily: '', fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
              addEditChild(context: context, child: null);
              /* controller.childList.add(Child(
                  fullName: "Maulik",
                  gender: "Male",
                  schooling: "12",
                  age: "13"));
              controller.childList.refresh();*/
                },
                child: const Icon(
              size: 30,
              Icons.add_circle,
              color: AppColor.grayText,
                ),
              )
            ],
          )
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChildListItem(
                    child: controller.childList[index],
                    pos: index,
                  );
                },
                itemCount: controller.childList.length,
              ),
              GestureDetector(
                onTap: () {
                  addEditChild(context: context, child: null);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    size: 30,
                    Icons.add_circle,
                    color: AppColor.grayText,
                  ),
                ),
              )
            ],
          ));
  }
}

void addEditChild({required BuildContext context, required Child? child,int pos =0}) {
  Get.bottomSheet(
    isScrollControlled: true,
    SingleChildScrollView(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            child: AddEditChildScreen(
              child: child,
              pos: pos,
            ))),
    backgroundColor: Colors.transparent,

  );
}

class ChildListItem extends StatelessWidget {
  var controller = Get.find<ReclaimerFormPageOneController>();

  ChildListItem({required this.child,required this.pos});

  late Child child;
  late int pos;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PopupMenuButtonState<int>> menuKey = GlobalKey();
    return ContainerWithShadowWidget(widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.local.child_details,
              style: controller.textTheme.subtitle2
                  ?.copyWith(color: AppColor.secondaryColor),
            ),
            /* GestureDetector(
                onTap: () => menuKey.currentState?.showButtonMenu(),
                child: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.grey,
                ),
              ),*/
            PopupMenuButton<int>(
              key: menuKey,

              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                  PopupMenuItem(
                    value: 0,
                    child: PopupMenuItemDesignWidget(
                      text: controller.local.edit,
                      iconData: Icons.edit,
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: PopupMenuItemDesignWidget(
                      text:controller.local.delete,
                      iconData: Icons.delete,
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                  controller.deleteChild(child);
                } else {
                  addEditChild(context: context, child: child,pos: pos);
                }
              },
            ),
          ],
        ),
        addVerticalSpace(10),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: ChildDetailTexts(
                  title: controller.local.full_name,
                  value: child.fullName,
                )),
            Expanded(
                flex: 1,
                child: ChildDetailTexts(
                  title: controller.local.gender,
                  value: child.gender,
                )),
          ],
        ),
        addVerticalSpace(20),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ChildDetailTexts(
                title: controller.local.schooling,
                value: child.schooling,
              ),
            ),
            Expanded(
              flex: 1,
              child: ChildDetailTexts(
                title: controller.local.age,
                value: child.age,
              ),
            ),
          ],
        ),
      ],
    ),);
  }
}



class ChildDetailTexts extends StatelessWidget {
  late String title;
  late String value;

  ChildDetailTexts({required this.title, required this.value});

  var controller = Get.find<ReclaimerFormPageOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: controller.textTheme.subtitle1?.copyWith(),
        ),
        Text(
          value,
          style: controller.textTheme.headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
