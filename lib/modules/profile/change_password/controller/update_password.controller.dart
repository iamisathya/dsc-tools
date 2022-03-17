import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../data/model/error_error_message.dart';
import '../../../../../data/model/general_models.dart';
import '../../../../../data/services/api_service.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/function.dart';
import '../../../../../utils/images.dart';
import '../../../../../widgets/plain_button.dart';

class UpdatePasswordController extends GetxController {
  // TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController enteNewPasswordCtrl = TextEditingController();
  TextEditingController reEnterNewPasswordCtrl = TextEditingController();
  GlobalKey widgetKey = GlobalKey();
  RxBool enterPasswordIsObscure = true.obs;
  RxBool reEnterPasswordIsObscure = true.obs;
  RxString errorMessages = ''.obs;

  // enter password field show/hide
  bool get isEnterPasswordIsObscure => enterPasswordIsObscure.value;
  set isEnterPasswordIsObscure(bool value) =>
      enterPasswordIsObscure.value = value;

  // re-enter password field show/hide
  bool get isReEnterPasswordIsObscure => reEnterPasswordIsObscure.value;
  set isReEnterPasswordIsObscure(bool value) =>
      reEnterPasswordIsObscure.value = value;

  RxBool isLoading = false.obs;

  Future<void> onClickSave() async {
    errorMessages.value = '';
    // if (currentPasswordCtrl.text.isEmpty) {
    //   errorMessages.value = "Password field shouldn't be empty!"; //! hardcoced
    //   return;
    // }
    if (enteNewPasswordCtrl.text.length <= 3) {
      errorMessages.value =
          "The password field must be atleast 4 characters"; //! hardcoced
      Scrollable.ensureVisible(widgetKey.currentContext!,
          duration: const Duration(milliseconds: 500));
      return;
    }
    if (enteNewPasswordCtrl.text.isEmpty ||
        (enteNewPasswordCtrl.text != reEnterNewPasswordCtrl.text)) {
      errorMessages.value =
          "Password & confirm passowrd must be match"; //! hardcoced
      Scrollable.ensureVisible(widgetKey.currentContext!,
          duration: const Duration(milliseconds: 500));
      return;
    }
    try {
      isLoading.toggle();
      final PasswordUpdateModel response = await ApiService.shared()
          .updatePassword(PasswordUpdateModel(value: enteNewPasswordCtrl.text));
      if (response.value.isNotEmpty &&
          response.value == enteNewPasswordCtrl.text) {
        _navigateToResultPage();
      }
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      if (e.response != null) {
        final ErrorMessage error =
            ErrorMessage.fromJson(e.response!.data as Map<String, dynamic>);
        if (error.error.message!.isNotEmpty) {
          errorMessages.value = error.error.message!;
        }
        returnResponse(e.response!);
      }
    } catch (err, stack) {
      isLoading.toggle();
      debugPrint(err.toString());
      debugPrint(stack.toString());
    }
  }

  void _navigateToResultPage() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        content: SizedBox(
          height: 415,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AppText(
                  text: "password_change_success".tr,
                  style: TextTypes.headline6,
                  align: TextAlign.center,
                ),
              ),
              SvgPicture.asset(kEnrolmentSuccessImage, height: 193, width: 200),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AppText(
                  text: "Your new password has been successfully changed".tr,
                  style: TextTypes.bodyText1,
                  align: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              PlainButton(
                title: 'ok_logout_now'.tr,
                onTap: () => Get.offAllNamed(Routes.LOGIN_HOME),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
    // Get.offAll(
    //   ScreenPaths.loginHome,
    //   arguments: OperationrResultModel(
    //       buttonText: 'back_to_account'.tr,
    //       headerText: 'account'.tr,
    //       message: 'thank_you'.tr,
    //       subContent: 'Your new password has been successfully changed',
    //       onPressDone: () => Get.back(),
    //       title: 'change_password'.tr),
    // );
  }
}