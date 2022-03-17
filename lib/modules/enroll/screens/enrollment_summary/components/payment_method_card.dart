import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../controller/enrollment.summary.controller.dart';
import 'payment_details.dart';
import 'payment_option_item.dart';

class PaymentMethodCard extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  PaymentMethodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                AppText(text: "payment_method".tr, style: TextTypes.headline6),
          ),
          Obx(
            () => Container(
              color: AppColor.gainsboro,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  PaymentOptionItem(
                      title: "credit_card_or_debit_card".tr,
                      icon: kCreditCardIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.creditCard,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.creditCard),
                  PaymentOptionItem(
                      title: "cash_on_delivery".tr,
                      icon: kCashOnDeliveryIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.cashOnDelivery,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.cashOnDelivery),
                  PaymentOptionItem(
                      title: "cash".tr,
                      icon: kCashPayIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.cashCounterPay,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.cashCounterPay),
                  PaymentOptionItem(
                      title: "ec_pay".tr,
                      icon: kECPayIcon,
                      onPress: () =>
                          controller.currentPaymentType = PaymentOptions.ecPay,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.ecPay),
                  PaymentOptionItem(
                      title: "prompt_pay".tr,
                      icon: kPromptPayIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.promptPay,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.promptPay),
                  PaymentOptionItem(
                      title: "bank_wire".tr,
                      icon: kBankWireIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.bankWire,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.bankWire),
                ],
              ),
            ),
          ),
          PaymentDetails()
        ],
      ),
    );
  }
}