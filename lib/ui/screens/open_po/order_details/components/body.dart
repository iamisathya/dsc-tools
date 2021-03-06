import 'package:dsc_tools/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/open_po_details.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/widgets/common_widgets.dart';
import '../../../../global/widgets/custom_loading_widget.dart';
import '../../controller/openpo.controller.dart';

class Body extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _renderChild(context));
  }

  Widget _renderChild(BuildContext context) {
    final TextEditingController commentCtrl = TextEditingController();
    commentCtrl.text = controller.openPlaceOrderId.comment;
    if (controller.loadingDetails.value == true) {
      return const CustomLoadingWidget(
        svgIcon: kImageApproveTask,
      );
    } else {
      return AnimatedContainer(
        duration: kAnimationDuration,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _renderRowItem(
                "dsc_info".tr, controller.openPlaceOrderId.orderDscid),
            _renderRowItem("date".tr, controller.openPlaceOrderId.orderDate),
            _renderRowItem("dsc_name".tr, controller.openPlaceOrderId.createBy),
            _renderProductCards(context),
            _renderDividerPadding(),
            renderTextField(
              ctlr: commentCtrl,
              label: "comment".tr,
              minLines: 1,
              enabled: false,
            ),
            _renderTotal(context),
            _renderDividerPadding(),
          ],
        ),
      );
    }
  }

  Padding _renderDividerPadding() {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Divider(
        thickness: 1,
        indent: 4,
        color: Colors.black,
      ),
    );
  }

  Column _renderTotal(BuildContext context) {
    return Column(children: [
      Padding(
        padding: kEdgeV12H16(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${"totalpv".tr}: ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            Text(
              controller.openPlaceOrderId.orderTotalPv,
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
          ],
        ),
      ),
      Padding(
        padding: kEdgeV12H16(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${"totalprice".tr}: ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            Text(
              controller.openPlaceOrderId.orderTotalPrice,
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
          ],
        ),
      )
    ]);
  }

  ListView _renderProductCards(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.openPlaceOrderDetails.length,
        itemBuilder: (context, position) {
          return _renderProductItem(
              controller.openPlaceOrderDetails[position], context);
        });
  }

  Card _renderProductItem(OpenPlaceOrderDetails item, BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kEdgeV12H16(),
            child: Text(
              item.productName,
              style: Theme.of(context).textTheme.productTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "${"itemcode".tr} : ",
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  item.productId,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          _renderCardItemRow("qty_order".tr, ": ${item.productQty}", context),
          _renderCardItemRow("pv".tr, ": ${item.totalPv}", context),
          _renderCardItemRow("itemprice".tr, ": ${item.productPrice}", context),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                  child: _renderCardItemBottomRow("${"totalpv".tr} :",
                      item.totalPv.toString(), context, 16)),
              Expanded(
                  child: _renderCardItemBottomRow(
                      "${"totalprice".tr} :", item.totalPrice, context, 0)),
            ],
          ),
        ],
      ),
    );
  }

  Padding _renderCardItemRow(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(title, style: Theme.of(context).textTheme.subtitle2)),
          Expanded(
              child: Text(value, style: Theme.of(context).textTheme.subtitle2))
        ],
      ),
    );
  }

  Padding _renderCardItemBottomRow(
      String title, String value, BuildContext context, double horPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: horPadding),
      child: Row(
        children: [
          SizedBox(
              width: 100,
              child: Text(title, style: Theme.of(context).textTheme.subtitle2)),
          Expanded(
              child: Text(value, style: Theme.of(context).textTheme.subtitle2))
        ],
      ),
    );
  }

  Padding _renderRowItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            decoration: normalBoxDecoration(),
            child: Text(value),
          )),
        ],
      ),
    );
  }
}
