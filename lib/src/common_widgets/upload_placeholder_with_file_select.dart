import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unigem_demo/src/common_widgets/container_with_shadow_widget.dart';
import 'package:unigem_demo/src/constants/app_styles.dart';
import 'package:unigem_demo/src/utils/helper_widgets.dart';
class UploadPlaceHolderWithFileSelectWidget extends StatelessWidget {
  late String title;
  late RxString path;

  UploadPlaceHolderWithFileSelectWidget({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(Get.context!).textTheme;
    final AppLocalizations local = AppLocalizations.of(Get.context!)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(20),
        Text(
          title,
          style: textTheme.subtitle2
              ?.copyWith(color: AppColor.primaryColor),
        ),
        addVerticalSpace(15),
        Obx(
              () => path.value.isEmpty
              ? Column(children: [
            GestureDetector(onTap: () {
              pickImage();

            },
              child: ContainerWithShadowWidget(
                padding: 0,
                widget: DottedBorder(
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  dashPattern: [5],
                  color: AppColor.grayTextFieldBorder,
                  radius: Radius.circular(15),
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          color: AppColor.grayTextFieldBorder,
                        ),
                        addHorizontalSpace(10),
                        Text(
                          local.upload_file,
                          style: textTheme.subtitle2?.copyWith(
                              color: AppColor.grayTextFieldBorder),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            addVerticalSpace(5),
            SizedBox(
              width: double.infinity,
              child: Text(
                local.only_one_document_can,
                style: textTheme.subtitle2
                    ?.copyWith(color: AppColor.grayTextFieldBorder),
                textAlign: TextAlign.end,
              ),
            ),
          ])
              :
          Column(
            children: [
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColor.grayText,
                        ),
                        addHorizontalSpace(10),
                        Flexible(child: Text(path.value,softWrap: true,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.remove_red_eye),
                        addHorizontalSpace(15),
                        GestureDetector(
                            onTap: () {
                              path.value="";
                            },
                            child: const Icon(Icons.delete_forever_outlined,color: Colors.red,)),
                      ],
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
            ],
          ),
        )
      ],
    );
  }
  Future pickImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      // final imageTemp = File(image.path);
      path.value=image.path;
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}