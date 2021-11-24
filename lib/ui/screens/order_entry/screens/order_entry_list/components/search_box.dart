import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../controllers/orderentry.product.list.controller.dart';
import '../../home/components/white_search_field.dart';

class SearchBox extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(20),
      color: AppColor.crayola,
      child: WhiteSearchField(
          controller: controller.searchUserTextController,
          onPress: controller.onSearchPressed,
          onChanged: controller.onTextChanged,
          hintText: "Search products",
          isFetching: controller.isFetching),
    );
  }
}
