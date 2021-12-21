import 'package:dsc_tools/ui/screens/enroll/controllers/enroll.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/globals.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

class PromptPaymentOption extends StatelessWidget {
  final EnrollHomeController ctrl = Get.put(EnrollHomeController());
  PromptPaymentOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 371,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(kPromptPayImage),
          AppText(
              text: "scan_qr_code_to_pay".tr,
              style: TextTypes.bodyText1,
              color: AppColor.ateneoBlue),
          SvgPicture.asset(kBarcodeExampleImage),
          Text(
            "${Globals.currency} ${ctrl.totalCartPrice}",
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: AppColor.kBlackColor,
                fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppText(
                    text: "${DateFormat('dd MMM yyyy').format(DateTime.now())} -",
                    style: TextTypes.bodyText1,
                    color: AppColor.charcoal),
              ),
              const AppText(
                  text: "01:55",
                  style: TextTypes.bodyText1,
                  color: AppColor.mediumAquamarine),
            ],
          )
        ],
      ),
    );
  }
}
