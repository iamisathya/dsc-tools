import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsc_tools/ui/global/widgets/bottom_button_bar.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'components/body.dart';
import 'controller/enrollment.userinfo.controller.dart';

class EnrollmentUserInfoScreen extends StatelessWidget {
  final EnrollmentUserInfoController controller =
      Get.put(EnrollmentUserInfoController());
  static const String routeName = '/enrollmentUserInfoHomePage';

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
            negetiveText: "Back",
            positiveText: "Continue",
            onTapPositiveButton: controller.verifyEnrollForm,
          ),
          floatingActionButton: AnimatedOpacity(
            opacity: controller.isScrolButtonVisible.value ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: FloatingActionButton(
              backgroundColor: const Color(0xFFFFBF3A),
              onPressed: controller.onTapScrollToTop,
              tooltip: 'scroll to top',
              child: const Icon(
                Icons.arrow_upward,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}