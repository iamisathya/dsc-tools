import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../../widgets/page_title.dart';
import '../../../enroll/screens/enrollment_details/components/error_message.dart';
import '../../terms_conditions/widgets/title_bar.dart';
import '../../update_email/widgets/text_input_field.dart';
import '../controller/update_password.controller.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final UpdatePasswordController _controller =
      Get.put(UpdatePasswordController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(title: "account".tr),
          TitleBar(
              title: 'change_password'.tr, icon: kProfileUserEditPencilIcon),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SvgPicture.asset(kProfileNewPasswordImage),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: AppText(
                      text: "change_password".tr, style: TextTypes.headline4),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            color: AppColor.brightGrayThird,
            child: Obx(
              () => Column(
                children: [
                  //? Hide temporarily
                  // ProfileTextField(
                  //     controller: _controller.currentPasswordCtrl,
                  //     labelText: "current_password".tr),
                  // const SizedBox(height: 30),
                  Obx(() => ProfileTextField(
                      controller: _controller.enteNewPasswordCtrl,
                      labelText: "new_password".tr,
                      showSuffix: true,
                      isObscure: _controller.isEnterPasswordIsObscure,
                      onPressSuffixIcon: () =>
                          _controller.isEnterPasswordIsObscure =
                              !_controller.isEnterPasswordIsObscure)),
                  const SizedBox(height: 30),
                  Obx(() => ProfileTextField(
                      textInputAction: TextInputAction.go,
                      controller: _controller.reEnterNewPasswordCtrl,
                      labelText: "re_enter_new_password".tr,
                      showSuffix: true,
                      isObscure: _controller.isReEnterPasswordIsObscure,
                      onPressSuffixIcon: () =>
                          _controller.isReEnterPasswordIsObscure =
                              !_controller.isReEnterPasswordIsObscure)),
                  const SizedBox(height: 20),
                  Container(
                      key: _controller.widgetKey,
                      child: _controller.errorMessages.isNotEmpty
                          ? ErrorMessage(
                              errors: [_controller.errorMessages.value])
                          : null),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}