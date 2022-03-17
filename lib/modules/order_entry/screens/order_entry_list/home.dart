import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../core/values/colors.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../../open_po/order_create/component/loader.dart';
import '../../controllers/orderentry.product.list.controller.dart';
import '../../orderentry.screen.dart';
import 'components/body.dart';

class OrderEntryList extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
            backgroundColor: AppColor.brightGray,
            appBar: OpenPoAppBar(),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Body(),
            ),
            bottomNavigationBar: BottomButtonBar(controller: controller)),
      ),
    );
  }
}

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OrderEntryProductListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const SizedBox()
          : Container(
              height: 90,
              color: AppColor.kWhiteColor,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(
                        title: "cancel".tr, onTap: controller.onCancel),
                  ),
                  Flexible(
                    child: controller.cartProducts.isEmpty
                        ? NuetralButton(
                            title: "next".tr,
                            onTap: controller.onClickNuetralButton)
                        : PositiveButton(
                            title: "next".tr,
                            onTap: controller.onClickPositiveButton),
                  ),
                ],
              ),
            ),
    );
  }
}