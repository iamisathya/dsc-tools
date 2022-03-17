import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../core/values/colors.dart';
import '../../../data/model/barcode_item_response.dart';
import '../../../utils/images.dart';
import '../../open_po/order_create/component/loader.dart';
import '../controller/barcode.scan.controller.dart';
import '../widgets/barcode_list_item.dart';

class BarcodeCheckResult extends StatelessWidget {
  final BarcodeScannerController controller =
      Get.put(BarcodeScannerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("${"order_number".tr}: ",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColor.kBlackColor)))),
      body: LoadingOverlay(
        isLoading: false,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 152,
              width: Get.width,
              color: AppColor.crayola,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(kCheckSuccessIcon,
                      height: 45,
                      width: 45,
                      semanticsLabel: 'barcode check icon'),
                  const SizedBox(height: 15),
                  Text("check_successfully".tr,
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 7),
                  Text("${"order_number".tr}: 423154182",
                      style: Theme.of(context).textTheme.bodyText2)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.barcodeItems?.items.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    final BarcodeItem item =
                        controller.barcodeItems!.items[index];
                    return BarcodeListItem(item: item, mainIndex: index);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}