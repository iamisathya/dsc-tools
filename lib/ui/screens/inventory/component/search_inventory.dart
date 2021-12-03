import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';
import '../../open_po/order_search/components/search_bar_field.dart';
import '../controller/inventory.search.controller.dart';

class SearchProducts extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchProducts> {
  final InventorySearchController controller =
      Get.put(InventorySearchController());

  Widget appBarTitle = const Text("");
  SvgPicture actionIcon = SvgPicture.asset(kSearchIcon,
      height: 20, key: const ObjectKey("seachIcon"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.key == const ObjectKey("seachIcon")) {
                  appBarTitle = SearchBarField(
                    // onTap: (String value) => controller.addSearchItem(value),
                    searchTextController: controller.searchTextController,
                    placeHolder: "${"item_number".tr}...",
                  );
                  controller
                      .addSearchItem(controller.searchTextController.text);
                } else {
                  appBarTitle = const Text("");
                }
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: AppColor.kWhiteSmokeColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "search_history".tr,
                      style: const TextStyle(
                          fontSize: 14, color: AppColor.kBlackColor),
                    ),
                    GestureDetector(
                      onTap: () => controller.clearHistory(),
                      child: Text(
                        "clear_all".tr,
                        style: const TextStyle(
                            fontSize: 14, color: AppColor.brinkPink),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: GestureDetector(
                      onTap: () => controller
                          .searchOrder(controller.searchHistory[index]),
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
      ),
    );
  }
}
