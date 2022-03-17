import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utils/constants.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../../open_po/order_create/component/loader.dart';
import '../controller/inventory.home.controller.dart';
import '../widgets/body.dart';

class InventoryHomeScreen extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
            backgroundColor: kWhiteSmokeColor,
            appBar: OpenPoAppBar(),
            body: Body())));
  }
}