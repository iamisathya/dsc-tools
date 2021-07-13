import 'package:code_magic_ex/ui/screens/order_entry/controllers/controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchRadioOptions extends StatelessWidget {
  final OrderEntryController controller = Get.put(OrderEntryController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: controller.searchRadioOptions
          .map((data) => Obx(() => Flexible(
                child: Container(
                  margin: kEdgeA8(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: kBorderAll(w: 3),
                      borderRadius: kBorderRadius()),
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(data.name),
                    activeColor: kMainColor,
                    groupValue: controller.seletedOption.value.index,
                    value: data.index,
                    onChanged: (val) => controller.onChangedSearchType(data),
                  ),
                ),
              )))
          .toList(),
    );
  }
}
