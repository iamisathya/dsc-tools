import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/bottom_button_bar.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../../open_po/order_create/component/loader.dart';
import 'components/body.dart';
import 'controller/enrollment.terms.controller.dart';

class EnrollmentTermsScreen extends StatelessWidget {
  final EnrollmentTermsController controller =
      Get.put(EnrollmentTermsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "back".tr,
            positiveText: "ok_got_it".tr,
            onTapPositiveButton: Get.back,
          ),
        ),
      ),
    );
  }
}