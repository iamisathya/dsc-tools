import 'package:dio/dio.dart';
import 'package:dsc_tools/api/api_address.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/open_order_id.dart';
import 'package:dsc_tools/models/open_po_details.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:photo_view/photo_view.dart';
import 'package:printing/printing.dart';

class OpenPoDetailsController extends GetxController
    with StateMixin<List<OpenPlaceOrderDetails>> {
  final MemberCallsService api;

  OpenPoDetailsController({required this.api});

  String currentPoNumber = "";
  String passedOrderNumber = "";
  String poOrderAttachment = "";

  OpenPlaceOrderId openPlaceOrderId = OpenPlaceOrderId();
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails =
      List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;
    
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      passedOrderNumber = data as String;
      getOpenPlaceOrderDetails(passedOrderNumber);
    }
    super.onInit();
  }

  Future<void> getOpenPlaceOrderDetails(String ponumber) async {
    isLoading.toggle();
    try {
      // * Getting order id from getOpenOrderId API - 203
      poOrderAttachment =
          await api.getPoOrderAttachment("getAttachment", ponumber);
      openPlaceOrderId = await api.getOpenOrderId("203", ponumber);
      currentPoNumber = openPlaceOrderId.orderId;
      // * Getting order details from from getOpenOrderDetails api - 204
      final List<OpenPlaceOrderDetails> detailsResponse =
          await api.getOpenOrderDetails("204", openPlaceOrderId.orderId);
      openPlaceOrderDetails = detailsResponse.obs;
      isLoading.toggle();
      change(openPlaceOrderDetails, status: RxStatus.success());
    } catch (err) {
      isLoading.toggle();
      change(null, status: RxStatus.error());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderId}) async {
        isLoading.toggle();
    final String imgUrl = "${Address.poOrder}?order_id=$orderId";
    final Dio dio = Dio();
    final response = await dio.get(imgUrl);
    // * removing background from html document
    final removedBackground =
        response.toString().replaceAll('background: rgb(204,204,204);', '');
    isLoading.toggle();
    await Printing.layoutPdf(
        dynamicLayout: false,
        onLayout: (PdfPageFormat format) async => Printing.convertHtml(
              format: format,
              html: removedBackground,
            ));
  }

  void openDialog(BuildContext context, String attchmentName) => showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          final String url = "${Address.resource}$attchmentName";
          return Dialog(
            child: PhotoView(
              tightMode: true,
              imageProvider: NetworkImage(url),
              heroAttributes: PhotoViewHeroAttributes(tag: url),
            ),
          );
        },
      );
}