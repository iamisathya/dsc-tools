import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../../../../data/model/inventory_item_v2.dart';
import '../../../../widgets/page_title.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../inventory_home/widgets/grand_total_price.dart';
import '../../inventory_home/widgets/inventory_item.dart';
import '../controller/inventory.search.result.controller.dart';

class InventorySearchResult extends StatelessWidget {
  final InventorySearchResultController controller =
      Get.put(InventorySearchResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageTitle(title: "Search results for: ${"inventory".tr}"),
            Column(
              children: [
                Column(
                  children: [
                    GrandTotal(
                        totalPrice: controller.totalCartPrice.value.toString(),
                        totalPv: controller.totalCartPv.toString()),
                    Container(
                      color: AppColor.kWhiteColor,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.itemsFound.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final InventoryItem item =
                              controller.itemsFound[index];
                          return InventoryItemClass(item: item);
                        },
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}