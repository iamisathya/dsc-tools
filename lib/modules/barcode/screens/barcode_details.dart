import 'package:dsc_tools/modules/home/controller/home.controller.dart';
import 'package:dsc_tools/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../../core/values/colors.dart';
import '../../../data/model/barcode_item_response.dart';
import '../../../utils/images.dart';
import '../../../widgets/bottom_button_bar.dart';
import '../../open_po/order_create/component/loader.dart';
import '../controller/barcode.scan.result.controller.dart';
import '../widgets/barcode_list_item.dart';
import '../widgets/barcode_product_item.dart';

class BarCodeDetails extends StatelessWidget {
  final BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: SingleChildScrollView(
              controller: controller.hideButtonController,
              child: controller.barcodeItems == null
                  ? const Center()
                  : Column(
                      children: [
                        Spacer(controller: controller),
                        if (controller.checkIfAnyPandingBarcodeScanLeft().value)
                          Column(
                            children: [
                              CustomAppBar(controller: controller),
                              BarcodeScanner(controller: controller),
                            ],
                          )
                        else
                          CompleteBarcodeScanSuccess(controller: controller),
                        BarcodeItemList(controller: controller)
                      ],
                    ),
            ),
          ),
          bottomNavigationBar:
              !controller.isLoading.value || controller.hasAnyChangesMade.value
                  ? const SizedBox()
                  : BottomButtonBar(
                      isShown: !controller.isLoading.value &&
                          controller.hasAnyChangesMade.value,
                      negetiveText: "cancel".tr,
                      positiveText: "save".tr,
                      onTapCancelButton: controller.showWarningMessage,
                      onTapPositiveButton: controller.saveBarcodeDetails,
                      showNeutral: false,
                    ),
          floatingActionButton: AnimatedOpacity(
            opacity: controller.isScroolButtonVisible.value ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: FloatingActionButton(
                backgroundColor: AppColor.sunglow,
                onPressed: controller.onTapScrollToTop,
                tooltip: 'scroll to top',
                child: const Icon(Icons.arrow_upward,
                    color: AppColor.kBlackColor)),
          ),
        ),
      ),
    );
  }
}

// class BottomButtonBar extends StatelessWidget {
//   const BottomButtonBar({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final BarcodeScannResultController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => controller.isLoading.value || !controller.hasAnyChangesMade.value
//           ? const SizedBox()
//           : Container(
//               height: 90,
//               color: AppColor.brightGray,
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     child: PlainButton(
//                       buttonColor: AppColor.sunglow,
//                       title: 'Cancel',
//                       titleColor: AppColor.kBlackColor,
//                       onTap: () => controller.showWarningMessage(),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Flexible(
//                     child: PlainButton(
//                       title: 'Save',
//                       onTap: () => controller.saveBarcodeDetails(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

class BarcodeItemList extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  BarcodeItemList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    const double _crossAxisSpacing = 8;
    final double _aspectRatio = _homeController.isMobileLayout ? 6 : 3;
    final int _crossAxisCount = _homeController.isMobileLayout ? 1 : 2;
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            crossAxisSpacing: _crossAxisSpacing,
            childAspectRatio: _aspectRatio,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.barcodeItems?.items.length,
          itemBuilder: (BuildContext ctxt, int index) {
            final BarcodeItem item = controller.barcodeItems!.items[index];
            if (item.require) {
              return BarcodeListItem(item: item, mainIndex: index);
            }
            return BarcodeProductItem(item: item);
          }),
    );
  }
}

class CompleteBarcodeScanSuccess extends StatelessWidget {
  const CompleteBarcodeScanSuccess({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: Get.width,
      color: AppColor.crayola,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(kBarcodeCheckSuccessIcon,
              height: 45, width: 45, semanticsLabel: 'barcode check icon'),
          const SizedBox(height: 15),
          AppText(text: "check_successfully".tr, style: TextTypes.headline6),
          const SizedBox(height: 7),
          AppText(
              text: "${"order_number".tr}: ${controller.orderNumber.value}",
              style: TextTypes.bodyText2),
        ],
      ),
    );
  }
}

class BarcodeScanner extends StatelessWidget {
  const BarcodeScanner({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.scanBarcode(context),
      child: Container(
        height: 94,
        color: AppColor.crayola,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          color: Colors.white,
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("scan_barcode".tr,
                    style: Theme.of(context).textTheme.subtitle2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SvgPicture.asset(kBarcodePlainIcon,
                    height: 20, width: 30, semanticsLabel: 'barcode icon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Spacer extends StatelessWidget {
  const Spacer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        color: controller.checkIfAnyPandingBarcodeScanLeft().value
            ? AppColor.kWhiteColor
            : AppColor.cadetBlue);
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BarcodeScannResultController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: controller.checkIfAnyPandingBarcodeScanLeft().value
          ? AppColor.kWhiteColor
          : AppColor.cadetBlue,
      height: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            height: 60,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new),
                iconSize: 25),
          ),
          Align(
            child: Text(
              "${"order_number".tr}: ${controller.orderNumber.value}",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppColor.kBlackColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}