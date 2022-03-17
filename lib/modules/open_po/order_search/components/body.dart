import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/enums.dart';
import '../../../../../widgets/text_view.dart';
import '../../../../core/values/colors.dart';
import '../controller/openpo.search.controller.dart';

class Body extends StatelessWidget {
  final OpenPoSearchController controller = Get.put(OpenPoSearchController());
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 54,
            color: AppColor.kWhiteSmokeColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                      text: "search_history".tr, style: TextTypes.subtitle1),
                  GestureDetector(
                    onTap: () => controller.clearHistory(),
                    child: AppText(
                      text: "clear_all".tr,
                      style: TextTypes.subtitle1,
                      color: AppColor.brinkPink,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.searchHistory.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () =>
                        controller.searchOrder(controller.searchHistory[index]),
                    child: Text(controller.searchHistory[index],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColor.cadet)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}