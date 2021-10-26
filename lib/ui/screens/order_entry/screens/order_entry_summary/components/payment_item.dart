
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.summary.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final OrderEntryCheckoutSummaryController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      elevation: 0,
      child: ListTile(
          title: AppText(
              text: controller.paymentTypes[index].name,
              style: TextTypes.subtitle1),
          leading: Radio(
              value: controller.paymentTypes[index].value,
              groupValue: controller.selectedPayment.value,
              fillColor: MaterialStateProperty.all<Color>(
                const Color(0xFF6FCF97),
              ),
              onChanged: null)),
    );
  }
}