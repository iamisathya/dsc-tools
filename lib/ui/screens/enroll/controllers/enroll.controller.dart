import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/models/managed_warehouse.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/searchble_dropdown.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_details/home.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/home/components/white_search_field.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utilities/extensions.dart';

class EnrollHomeController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController searchProductTextController = TextEditingController();
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  final Rx<InventoryRecords> searchResult = InventoryRecords(items: []).obs;
  ManagedWarehouses warehouses = ManagedWarehouses(items: []);
  RxInt totalCartPv = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onInit() {
    getManagedWarehouses();
    // cartProducts
    //     .listen((c) => {cartProducts.refresh(), calculateTotal()});
    super.onInit();
  }

  Future<void> getManagedWarehouses() async {
    isLoading.toggle();
    try {
      warehouses = await ApiService.shared().getManagedWarehouses();
      if (warehouses.items.isNotEmpty) {
        await loadInventoryProducts(
            warehouses.items[0].href.getAfterLastSlash());
        isLoading.toggle();
      } else {
        isLoading.toggle();
        SnackbarUtil.showError(message: "No warehouses found");
      }
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> loadInventoryProducts(String warehouseId) async {
    const String type = "item";
    try {
      inventoryRecords.value =
          await ApiService.shared().getInventoryRecords(warehouseId, type);
      searchResult.value.items = List.from(inventoryRecords.value.items);
    } on DioError catch (e) {
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: "Error! $message");
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  void onSearchTextChange(String searchKey) {
    if (searchKey == "") {
      searchResult.value.items = List.from(inventoryRecords.value.items);
      return;
    }
    searchResult.value.items.clear();
    searchResult.value.items = inventoryRecords.value.items
        .where((item) => item.catalogSlideContent.content.description
            .toLowerCase()
            .contains(searchKey.toLowerCase()))
        .toList();
    searchResult.refresh();
  }

  void removeItem(String itemCode) {
    cartProducts.removeWhere((element) => element.itemCode == itemCode);
    cartProducts.refresh();
    calculateTotal();
  }

  void onContinue() {
    if(cartProducts.isEmpty){
      SnackbarUtil.showWarning(message: "Please add some products to cart before proceed!");
      return;
    }
    Get.to(() => EnrollmentDetailsHomeScreen());
  }

  void showBottomModal(BuildContext context) {    
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF5F5F5),
      context: context,
      isDismissible: true,
      builder: (context) {
        return DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.75,
          expand: false,
          builder: (_, ctrl) => Container(
            color: const Color(0xFFE3E8ED),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: WhiteSearchField(
                      controller: searchProductTextController,
                      onChanged: (val) => onSearchTextChange(val),
                      onPress: () {},
                      hintText: "Search Products",
                      isFetching: false.obs),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      controller: ctrl,
                      itemCount: searchResult.value.items.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final InventoryRecordItems item =
                            searchResult.value.items[index];
                        return GestureDetector(
                          onTap: () {
                            addItemToCart(item);
                            Navigator.pop(context);
                          },
                          child: Card(
                            child: Container(
                              height: 75,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: SvgPicture.asset(
                                        kProductPlaceholderImage,
                                        width: 80),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            item.catalogSlideContent.content
                                                .description,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: const Color(
                                                        0xFF384250))),
                                        AppText(
                                          text: "Code: ${item.item.id.unicity}",
                                          style: TextTypes.caption,
                                          color: const Color(0xFF9EA9B9),
                                        ),
                                        AppText(
                                          text:
                                              "${item.terms.pvEach} PV | ${item.terms.priceEach} ${Globals.currency}",
                                          style: TextTypes.subtitle2,
                                          color: const Color(0xFF384250),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).whenComplete(() => searchProductTextController.text = "");
  }

  Future<void> addItemToCart(InventoryRecordItems cartItem) async {
    final CartProductsItem target = cartProducts.firstWhere(
        (item) => item.itemCode == cartItem.item.id.unicity,
        orElse: () => CartProductsItem());
    if (target.itemCode != "") {
      onUpdateQuantity(CartUpdate.increament, target.itemCode);
    } else {
      final CartProductsItem i = CartProductsItem(
          itemCode: cartItem.item.id.unicity,
          productName: cartItem.catalogSlideContent.content.description,
          quantity: 1,
          itemPrice: cartItem.terms.priceEach,
          itemPv: cartItem.terms.pvEach,
          totalPrice: 1 * cartItem.terms.priceEach,
          totalPv: 1 * cartItem.terms.pvEach);
      cartProducts.insert(0, i);
      calculateTotal();
    }
  }

  void onUpdateQuantity(CartUpdate type, String itemCode) {
    final CartProductsItem target =
        cartProducts.firstWhere((item) => item.itemCode == itemCode);
    if (target.itemCode != "") {
      if (CartUpdate.increament == type) {
        target.quantity = target.quantity + 1;
        target.totalPrice = target.quantity * target.itemPrice;
        target.totalPv = target.quantity * target.itemPv;
      } else {
        if (target.quantity == 1) {
          cartProducts.removeWhere((item) => item.itemCode == itemCode);
        } else {
          target.quantity = target.quantity - 1;
          target.totalPrice = target.quantity * target.itemPrice;
          target.totalPv = target.quantity * target.itemPv;
        }
      }
    }
    cartProducts.refresh();
    calculateTotal();
  }

  void calculateTotal() {
    totalCartPrice.value =
        cartProducts.fold(0, (i, element) => i + element.totalPrice);
    totalCartPv.value =
        cartProducts.fold(0, (i, element) => i + element.totalPv);
  }
}
