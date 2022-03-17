import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/images.dart';
import '../controller/inventory.home.controller.dart';

class InventoryToolBar extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  final bool hideSearch;
  final VoidCallback onTapPrint;
  final VoidCallback onTapExport;

  InventoryToolBar(
      {this.hideSearch = false,
      required this.onTapPrint,
      required this.onTapExport});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.sunglow,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Flexible(
              flex: 3,
              child: Row(
                children: controller.allStockTypes
                    .map((element) => GestureDetector(
                        onTap: () =>
                            controller.onChangeStockType(element.value),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(element.name,
                              style: controller.activeStockType == element.value
                                  ? Theme.of(context).textTheme.subtitle1
                                  : Theme.of(context).textTheme.bodyText2),
                        )))
                    .toList(),
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => onTapPrint(),
                    child: SvgPicture.asset(kPrintIcon,
                        width: 20, semanticsLabel: 'print icon'),
                  ),
                  GestureDetector(
                    onTap: () => onTapExport(),
                    child: SvgPicture.asset(kDownloadIcon,
                        width: 20, semanticsLabel: 'download icon'),
                  ),
                  if (hideSearch == false)
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.INVENTORY_SEARCH), 
                      child: SvgPicture.asset(kSearchIcon,
                          width: 20, semanticsLabel: 'search icon'),
                    ),
                ],
              )),
        ],
      ),
    );
  }
}