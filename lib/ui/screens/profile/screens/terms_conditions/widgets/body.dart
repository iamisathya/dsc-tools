import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'title_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleBar(title: "terms_and_conditions".tr, icon: kCartIcon),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SvgPicture.asset(kEnrolmentSuccessImage),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: AppText(
                text: "retail_purchasing_program".tr,
                style: TextTypes.headline4),
          ),
          Container(
              color: AppColor.brightGray,
              padding: const EdgeInsets.all(20),
              child: AppText(
                  text: 
                  "retail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_programretail_purchasing_program",
                  style: TextTypes.headline6))
        ],
      ),
    );
  }
}
