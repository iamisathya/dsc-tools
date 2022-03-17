import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../core/values/colors.dart';
import '../../../data/model/barcode_item_response.dart';
import '../../../utils/images.dart';
import '../../../widgets/plain_button.dart';
import '../../open_po/order_create/component/loader.dart';
import '../controller/salesreport.details.controller.dart';
import 'barcode_product_item.dart';

class SalesReportOrderDetials extends StatelessWidget {
  final SalesReportDetailsController controller =
      Get.put(SalesReportDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: AppBar(
              title: Obx(() => Text(
                  "${"order_number".tr}: ${controller.orderNumber.value}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColor.kBlackColor)))),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 94,
                  color: AppColor.cadetBlue,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    height: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("scan_barcode".tr,
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
                      color: AppColor.kWhiteColor,
                      border: Border.all(
                          color: AppColor.americanSilver, width: 0.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(3.0))),
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
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
                                  child: Text("${"scan".tr}: 0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                )
                              ],
                            ),
                            Text("${"qty".tr}: 1",
                                style: Theme.of(context).textTheme.bodyText2)
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text("Promo Free Sanitizer Spray TH",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${"code".tr}: 19236",
                                style: Theme.of(context).textTheme.bodyText2),
                            Text("${"remains".tr}: 1",
                                style: Theme.of(context).textTheme.bodyText2)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 20),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.listSize,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final BarcodeItem item = controller.products[index];
                        return BarcodeProductItem(item: item);
                      }),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Obx(
            () => controller.isLoading.value
                ? const SizedBox()
                : Container(
                    height: 90,
                    color: AppColor.brightGray,
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: PlainButton(
                            buttonColor: AppColor.sunglow,
                            title: 'cancel'.tr,
                            titleColor: AppColor.kBlackColor,
                            onTap: () => {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: PlainButton(
                            title: 'save'.tr,
                            onTap: () => {},
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}