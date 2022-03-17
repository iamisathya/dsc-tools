import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/provider/globals.dart';
import '../../../controllers/enroll.controller.dart';
import 'each_info_row.dart';

class TotalAmountCard extends StatelessWidget {
  final EnrollHomeController ctrl = Get.put(EnrollHomeController());
  TotalAmountCard({
    Key? key,
    required this.boldFont,
  }) : super(key: key);

  final TextStyle boldFont;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
        child: Column(
          children: [
            EeachUserinfoItem(
                title: "product_price".tr,
                value: "${ctrl.totalCartPrice} ${Globals.currency}"),
            EeachUserinfoItem(
                title: "delivery_fee".tr, value: "0 ${Globals.currency}"),
            EeachUserinfoItem(title: "ship_method".tr, value: "Delivery"),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 12.5),
                child: Container(decoration: DottedDecoration())),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("total_pv".tr, style: boldFont)),
                  Flexible(
                    flex: 2,
                    child:
                        Text("${ctrl.totalCartPv} ${"pv".tr}", style: boldFont),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("total_price".tr, style: boldFont)),
                  Flexible(
                    flex: 2,
                    child: Text("${ctrl.totalCartPrice} ${Globals.currency}",
                        style: boldFont),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}