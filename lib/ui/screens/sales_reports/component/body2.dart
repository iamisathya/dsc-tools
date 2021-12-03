import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/sales_report_item_item.dart';
import '../../../../models/sales_report_order_item.dart';
import '../../../../models/sales_report_rma_item.dart';
import '../../inventory/component/no_record_found.dart';
import '../../inventory/component/page_title.dart';
import '../controller/salesreports.home.controller.dart';
import 'date_selector.dart';
import 'date_selector_row.dart';
import 'sales_report.item.item.dart';
import 'sales_report.order.item.dart';
import 'sales_report.rma.item.dart';
import 'tool_bar.dart';

class Body2 extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PageTitle(title: "sales_report".tr),
            SalesReportToolBar(),
            const SizedBox(height: 5),
            if (controller.activeListLength != 0)
              RowDateSelector()
            else
              DateSelector(),
            if (!controller.isLoading.value && controller.activeListLength != 0)
              Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.activeListLength,
                    itemBuilder: (BuildContext ctxt, int index) {
                      if (controller.activeTab == "order") {
                        final SalesReportOrderItem item =
                            controller.allSalesReports[index];
                        return SalesReportEachOrderItem(item: item);
                      } else if (controller.activeTab == "rma") {
                        final SalesReportRmaItem item =
                            controller.allSalesRmaReports[index];
                        return SalesReportEachRmaItem(item: item);
                      }
                      final SalesReportItemItem item =
                          controller.allSalesItemReports[index];
                      return SalesReportEachItemItem(item: item);
                    },
                  ),
                ],
              ),
            if (!controller.isLoading.value &&
                controller.activeListLength == 0 &&
                controller.isDataFetched.value)
              NoRecordFound(),
          ],
        ),
      ),
    );
  }
}
