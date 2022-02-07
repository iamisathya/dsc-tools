import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../../global/widgets/bottom_button_bar.dart';
import '../../../../../open_po/order_create/component/app_bar.dart';
import '../../../../../open_po/order_create/component/loader.dart';
import 'controller/change_password.controller.dart';
import 'widgets/body.dart';

class ChangePasswordScreen extends StatelessWidget {
  final ChangePasswordController controller =
      Get.put(ChangePasswordController());

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "cancel".tr,
            positiveText: "continue".tr,
            onTapPositiveButton: controller.onClickContinue,
          ),
        ),
      ),
    );
  }
}
