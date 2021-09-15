import 'package:dsc_tools/models/sales_report_details.dart';
import 'package:dsc_tools/ui/global/widgets/plain_button.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreport.details.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'barcode_product_item.dart';

class SalesReportOrderDetials extends StatelessWidget {
  final SalesReportDetailsController controller =
      Get.put(SalesReportDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("Order Number: ${controller.orderNumber.value}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFF000000))))),
      body: Obx(() => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 94,
                  color: const Color(0xFF5297A6),
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    height: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Scan Barcode",
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset(kBarcodePlainIcon,
                              height: 20,
                              width: 30,
                              semanticsLabel: 'barcode icon'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(
                            color: const Color(0xFFD0D0CF), width: 0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3.0))),
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0),
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(kWarningIcon,
                                        height: 25,
                                        width: 25,
                                        semanticsLabel: 'warning icon'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Text("Scan: 0",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                    )
                                  ],
                                ),
                                Text("Qty: 1",
                                    style:
                                        Theme.of(context).textTheme.bodyText2)
                              ],
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text("Promo Free Sanitizer Spray TH",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Code: 19236",
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Text("Remains: 1",
                                    style:
                                        Theme.of(context).textTheme.bodyText2)
                              ],
                            ),
                          ],
                        ))),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 20),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.listSize,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final Items item = controller.products[index];
                        return BarcodeProductItem(item: item);
                      }),
                ),
              ],
            ),
          ))),
      bottomNavigationBar: Container(
        height: 90,
        color: const Color(0xFFE3E8ED),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: PlainButton(
                buttonColor: const Color(0xFFFFBF3A),
                title: 'Cancel',
                titleColor: const Color(0xFF000000),
                onTap: () => null,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: PlainButton(
                title: 'Save',
                onTap: () => null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}