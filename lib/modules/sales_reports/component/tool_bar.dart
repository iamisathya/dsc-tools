import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/images.dart';
import '../controller/salesreports.home.controller.dart';

class SalesReportToolBar extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.sunglow,
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Flexible(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.sortOptions
                      .map((element) => GestureDetector(
                          onTap: () =>
                              controller.onChangeViewType(element.value),
                          child: Text(element.name.tr,
                              style: controller.activeStockType.value.name ==
                                      element.name
                                  ? Theme.of(context).textTheme.subtitle1
                                  : Theme.of(context).textTheme.bodyText2)))
                      .toList()))),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (controller.activeListLength != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () =>
                            controller.proceedToPrint(context, orderHref: ""),
                        child: SvgPicture.asset(kPrintIcon,
                            width: 20, semanticsLabel: 'print icon'),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: (controller.isLoading.value)
                        ? Image.asset(kAnimatedSpin, width: 20)
                        : GestureDetector(
                            onTap: () => Get.toNamed(Routes.SALES_REPORT_SEARCH),
                            child: SvgPicture.asset(kSearchIcon,
                                width: 20, semanticsLabel: 'search icon'),
                          ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}