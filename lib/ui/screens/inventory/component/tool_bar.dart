import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../controller/inventory.home.controller.dart';
import 'search_inventory.dart';

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
      color: AppColor.brightGray,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Flexible(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.stockOptions
                      .map((element) => GestureDetector(
                          onTap: () =>
                              controller.onChangeStockType(element.value),
                          child: Text(element.name,
                              style: controller.activeStockType.value.name ==
                                      element.name
                                  ? Theme.of(context).textTheme.subtitle1
                                  : Theme.of(context).textTheme.bodyText2)))
                      .toList()))),
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
                  if (hideSearch == true)
                    const SizedBox(width: 0)
                  else
                    GestureDetector(
                      onTap: () => Get.to(() => SearchProducts()),
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
