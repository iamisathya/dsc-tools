import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/enums.dart';
import '../../../../../widgets/text_view.dart';
import '../../../../core/styles/border.dart';
import '../../../../core/values/colors.dart';
import '../controller/openpo.details.controller.dart';

class OpenPoDetailsTopBar extends StatelessWidget {
  final OpenPoDetailsController controller = Get.put(OpenPoDetailsController());
  OpenPoDetailsTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: AppColor.crayola,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 30, bottom: 10, right: 30),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: borderRadiusWithColor(bgColor: Colors.white),
                    child: AppText(
                        text: controller.openPlaceOrderId.orderDscid,
                        style: TextTypes.subtitle2,
                        color: AppColor.darkLiver),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: borderRadiusWithColor(bgColor: Colors.white),
                    child: AppText(
                        text: controller.openPlaceOrderId.orderDate,
                        style: TextTypes.subtitle2,
                        color: AppColor.darkLiver),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20, right: 30),
            child: Container(
              width: double.infinity,
              decoration: borderRadiusWithColor(bgColor: Colors.white),
              height: 40,
              child: Center(
                  child: AppText(
                      text: controller.openPlaceOrderId.createBy,
                      style: TextTypes.subtitle2,
                      color: AppColor.darkLiver)),
            ),
          ),
        ],
      ),
    );
  }
}