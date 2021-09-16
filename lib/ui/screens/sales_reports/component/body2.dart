import '../../../global/widgets/plain_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/sales_report_item_item.dart';
import '../../../../models/sales_report_order_item.dart';
import '../../../../models/sales_report_rma_item.dart';
import '../../../../utilities/images.dart';
import '../../../global/widgets/sign_out_button.dart';
import '../../inventory/component/no_record_found.dart';
import '../../inventory/component/page_title.dart';
import '../controller/salesreports.home.controller.dart';
import 'date_selector.dart';
import 'option_bar.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        children: [
        const PageTitle(title: "Sales Report"),
        SalesReportToolBar(),
        DateSelector(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SignOutButton(
            title: "Find Sales Reports",
            onPress: () => controller.getAllSalesReports(),
            bgColor: const Color(0xFFFFBF3A),
            icon: kArrowIcon,
          ),
        ),
        if (!controller.isLoading.value && controller.activeListLength != 0)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: OptionBar(
                    onPrint: () =>
                        controller.proceedToPrint(context, orderHref: ""),
                    onDownload: () => controller.onTapExportExcellSheet()),
              ),
              Obx(() => ListView.builder(
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
                  })),
            ],
          ),
        if (!controller.isLoading.value && controller.activeListLength == 0)
          NoRecordFound(),
      ]),
    );
  }
}
