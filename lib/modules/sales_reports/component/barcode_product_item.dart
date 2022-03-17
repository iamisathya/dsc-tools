import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../data/model/barcode_item_response.dart';
import '../../../utils/images.dart';

class BarcodeProductItem extends StatelessWidget {
  final BarcodeItem item;

  const BarcodeProductItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 65,
      decoration: BoxDecoration(
          color: AppColor.kWhiteColor,
          border: Border.all(color: AppColor.americanSilver, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(kSuccessIcon,
                height: 25, width: 25, semanticsLabel: 'success icon'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.desc, style: Theme.of(context).textTheme.bodyText1),
                Text("${"scanned".tr}:${item.scan}/${item.qty}",
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(kPlusIcon,
                height: 15, width: 15, semanticsLabel: 'add icon'),
          ),
        ],
      ),
    );
  }
}