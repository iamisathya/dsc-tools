import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/controller/add.openpo.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BrosweAttachment extends StatelessWidget {
  const BrosweAttachment({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CreateOpenPoOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      color: AppColor.brightGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Obx(
            () => Text(
                controller.selectedFileName.value.isNotEmpty
                    ? controller.selectedFileName.value
                    : "attach_file".tr, //!hardcoded
                overflow: TextOverflow.ellipsis),
          )),
          TextButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
              onPressed: controller.selectSource,
              icon: SvgPicture.asset(kFileIcon, color: AppColor.dodgerBlue),
              label: AppText(
                text: "browse".tr, //!hardcoded
                style: TextTypes.subtitle2,
                color: AppColor.dodgerBlue,
              ))
        ],
      ),
    );
  }
}
