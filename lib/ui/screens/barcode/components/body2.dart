import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final BarcodeScannerController controller =
      Get.put(BarcodeScannerController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: Get.height),
      child: IntrinsicHeight(
        child: Column(children: [
          GestureDetector(child: const PageTitle(title: "Barcode Tracker"), onTap: () => controller.scanBarcode(),),
          Container(
            height: 104,
            color: const Color(0xFF5297A6),
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color(0xFFFFFFFF),
              ),
              child: TextField(
                controller: controller.bardcodeTextField,
                onSubmitted: (val) => controller.getBarcodePath(context, val),
                onEditingComplete: () => controller.getBarcodePath(context, controller.bardcodeTextField.text),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'Order Number',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 20, minWidth: 20),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                        onTap: () => controller.scanBarcode(),
                        child: SvgPicture.asset(kBarcodeScanIcon,
                            width: 20, height: 20)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: SvgPicture.asset(kScanBarcodeIllustration,
                  width: 254, height: 252))
        ]),
      ),
    ));
  }
}
