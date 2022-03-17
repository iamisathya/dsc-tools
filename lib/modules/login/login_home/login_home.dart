import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../open_po/order_create/component/loader.dart';
import 'controller/login.controller.dart';
import 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.loading.value,
          progressIndicator: const Loader(),
          child: Body(),
        ),
      ),
    );
  }
}