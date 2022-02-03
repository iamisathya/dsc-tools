import 'package:dsc_tools/ui/global/widgets/bottom_button_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/loader.dart';
import 'package:dsc_tools/ui/screens/profile/screens/change_password/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'controller/update_password.controller.dart';

class UpdatePasswordScreen extends StatelessWidget {
  static const String routeName = "/updatePasswordScreen";
  UpdatePasswordScreen({Key? key}) : super(key: key);

  final UpdatePasswordController _controller = Get.put(UpdatePasswordController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: _controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "cancel".tr,
            positiveText: "save_password".tr,
            onTapPositiveButton: _controller.onClickSave,
          ),
        ),
      ),
    );
  }
}
