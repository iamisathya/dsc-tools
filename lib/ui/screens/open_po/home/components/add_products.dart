import 'package:dsc_tools/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants/globals.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../../../../global/widgets/bottom_button_bar.dart';
import '../../controller/add.openpo.controller.dart';
import 'loader.dart';
import 'po_cart_item.dart';
import 'total_price_container.dart';

class CreateOpenPoOrder extends GetView<CreateOpenPoOrderController> {
  static const String routeName = '/createOpenPoOrder';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: AppColor.kWhiteSmokeColor,
          appBar: AppBar(
              title: const Text(
            "New PO",
            style: TextStyle(fontSize: 24, color: AppColor.kBlackColor),
          )),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: Get.height - 334),
                    child: Column(
                      children: [
                        const UserInformation(),
                        Obx(() => ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.cartProducts.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              final CartProductsItem item =
                                  controller.cartProducts[index];
                              return PoCartItem(item: item, idx: index);
                            })),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Obx(() => TotalPrice(
                            totalPrice:
                                controller.totalCartPrice.value.toString(),
                            totalPv: controller.totalCartPv.value.toString(),
                            bgColor: AppColor.kWhiteSmokeColor,
                          )),
                      BrosweAttachment(controller: controller)
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: () => controller.showBottomModal(context),
            negetiveText: "+ Add",
            positiveText: "Place Order",
            onTapPositiveButton: () => controller.validateOrder(context),
          ),
        ),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: AppColor.crayola,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 30, bottom: 10, right: 30),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    height: 40,
                    child: Center(
                        child: Text(
                      Globals.userId,
                      style: const TextStyle(
                          color: AppColor.manatee, fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    height: 40,
                    child: Center(
                        child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      style: const TextStyle(
                          color: AppColor.manatee, fontSize: 14),
                    )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20, right: 30),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: 40,
              child: Center(
                  child: Text(
                Globals.userInfo.humanName.fullName,
                style: const TextStyle(color: AppColor.manatee, fontSize: 14),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class BrosweAttachment extends StatelessWidget {
  const BrosweAttachment({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CreateOpenPoOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      color: AppColor.brightGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Obx(
            () => Text(
                controller.selectedFileName.value.isNotEmpty
                    ? controller.selectedFileName.value
                    : "Attach File",
                overflow: TextOverflow.ellipsis),
          )),
          TextButton.icon(
            style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
              onPressed: controller.selectSource,
              icon: SvgPicture.asset(kFileIcon, color: AppColor.dodgerBlue),
              label: const AppText(
                text: "Browse",
                style: TextTypes.subtitle2,
                color: AppColor.dodgerBlue,
              ))
        ],
      ),
    );
  }
}
