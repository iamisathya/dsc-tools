import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../../../controllers/orderentry.product.list.controller.dart';
import '../../../controllers/orderentry.summary.controller.dart';

class FilterTabs extends StatelessWidget {
  final OrderEntryCheckoutSummaryController controller =
      Get.put(OrderEntryCheckoutSummaryController());

  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(
              children: [
                GestureDetector(
                    onTap: () =>
                        controller.onTabChange(OrderEntrySummaryFilters.myCart),
                    child: AppText(
                        text: "my_cart".tr,
                        style: controller.filterMethod.value == "myCart"
                            ? TextTypes.subtitle1
                            : TextTypes.bodyText1,
                        color: AppColor.darkLiver)),
                const SizedBox(width: 30),
                GestureDetector(
                    onTap: () => controller
                        .onTabChange(OrderEntrySummaryFilters.paymentType),
                    child: AppText(
                        text: "payment_type".tr,
                        style: controller.filterMethod.value == "paymentType"
                            ? TextTypes.subtitle1
                            : TextTypes.bodyText1,
                        color: AppColor.darkLiver)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => controller.onCancel(context),
            child: SvgPicture.asset(
              kTrashIcon,
              width: 20,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}