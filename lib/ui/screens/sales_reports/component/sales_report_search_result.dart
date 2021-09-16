import 'package:dsc_tools/models/sales_report_item_item.dart';
import 'package:dsc_tools/models/sales_report_order_item.dart';
import 'package:dsc_tools/models/sales_report_rma_item.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreport.search.result.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'option_bar.dart';
import 'sales_report.item.item.dart';
import 'sales_report.order.item.dart';
import 'sales_report.rma.item.dart';

class SalesReportSearchResult extends StatelessWidget {
  final SalesReportSearchResultController controller =
      Get.put(SalesReportSearchResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: Column(
        children: [
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Text("World of Wellness co., Ltd.",
                style: Theme.of(context).textTheme.headline6),
          ),
          OptionBar(
            onPrint: () => controller.proceedToPrint(),
            onDownload: () => controller.onTapExportExcellSheet(),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.activeListLength,
              itemBuilder: (BuildContext ctxt, int index) {
                if (controller.type.value == "order") {
                  final SalesReportOrderItem item =
                      controller.allSalesReports[index];
                  return SalesReportEachOrderItem(item: item);
                } else if (controller.type.value == "rma") {
                  final SalesReportRmaItem item =
                      controller.allSalesRmaReports[index];
                  return SalesReportEachRmaItem(item: item);
                }
                final SalesReportItemItem item =
                    controller.allSalesItemReports[index];
                return SalesReportEachItemItem(item: item);
              }),
        ],
      ),
    );
  }
}
