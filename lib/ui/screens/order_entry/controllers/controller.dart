import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/find_customer.dart';
import 'package:code_magic_ex/models/search_customer.dart';
import 'package:code_magic_ex/models/search_reponse_by_href.dart';
import 'package:code_magic_ex/models/user_minimal_data.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/order_entry_table/order_entry.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryController extends GetxController {
  RxInt selectedTab = 0.obs;

  RxList<OrderEntryRadioButton> searchRadioOptions = [
    OrderEntryRadioButton(
      index: 0,
      name: "BA's ID",
    ),
    OrderEntryRadioButton(
      index: 1,
      name: "Govt ID, Name..",
    ),
  ].obs;

  RxBool isSearching = false.obs;
  RxString errorMessage = "".obs;

  Rx<OrderEntryRadioButton> seletedOption =
      OrderEntryRadioButton(index: 0, name: "BA's ID").obs;

  TextEditingController searchIdTextController = TextEditingController();
  SearchCustomer searchedResultsOfHref = SearchCustomer(items: []);
  FindCustomer searchedGuestUserInfo = FindCustomer(items: []);
  RxList<SearchedUserInfo> searchResultsOfUserInfo = <SearchedUserInfo>[].obs;

  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchIdTextController.text = "3011266";
    // controller.getOrderEntryProductList("userId");
  }

  void onChangedSearchType(OrderEntryRadioButton data) {
    seletedOption.value = searchRadioOptions[data.index];
    update();
  }

  Future<void> searchUserBySearchQuery(BuildContext context) async {
    if (searchIdTextController.text.isEmpty) {
      renderErrorSnackBar(
          title: "Enroller ID empty", subTitle: "Please enter valid enroller");
      return;
    }
    isSearching.value = true;
    if (seletedOption.value.index == 0) {
      searchUserById(context);
    } else {
      searchUserBySearchKey(context);
    }
    update();
  }

  Future<void> searchUserById(BuildContext context) async {
    _sendingMsgProgressBar.show(context);
    try {
      // * search for users by user id(search key)
      searchedGuestUserInfo = await ApiService.shared().findCustomer(
          Parsing.intFrom(searchIdTextController.text)!, "customer");
      if (searchedGuestUserInfo.items.isNotEmpty) {
        // Move to details page
        final UserMinimalData user = UserMinimalData(
            fullName: searchedGuestUserInfo.items[0].humanName.fullName,
            email: searchedGuestUserInfo.items[0].email,
            userId: searchedGuestUserInfo.items[0].id.unicity);
        Get.to(() => OrderEntryTable(), arguments: user);
      }
      _sendingMsgProgressBar.hide();
      isSearching(false);
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    } finally {
      isSearching(false);
    }
  }

  Future<void> searchUserBySearchKey(BuildContext context) async {
    _sendingMsgProgressBar.show(context);
    try {
      // * search for users by user id(search key)
      searchedResultsOfHref = await ApiService.shared()
          .searchCustomer(searchIdTextController.text, 1);
      if (searchedResultsOfHref.items.isNotEmpty) {
        final List<String> data =
            searchedResultsOfHref.items.map((e) => e.href).toList();
        searchUsersByHref(data);
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    }
  }

  Future<void> searchUsersByHref(List<String> results) async {
    try {
      // * search for users by user id(search key)
      searchResultsOfUserInfo.value = await MemberCallsService.init()
          .searchUsersByHref("getBAInfo", results);
      _sendingMsgProgressBar.hide();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    } finally {
      update();
      isSearching(false);
    }
  }

  void _onDioError(DioError e) {
    _sendingMsgProgressBar.hide();
    errorMessage(e.error.toString());
    renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    returnResponse(e.response!);
  }

  void _onCatchError(Object err) {
    errorMessage(err.toString());
    LoggerService.instance.e(err.toString());
    _sendingMsgProgressBar.hide();
  }

  void onClickOpenOrderEntry(SearchedUserInfo user) {
    final UserMinimalData userData = UserMinimalData(
        fullName: user.humanName.fullName,
        email: user.email,
        userId: user.id.unicity.toString());
    Get.to(() => OrderEntryTable(), arguments: userData);
  }
}

class OrderEntryRadioButton {
  String name;
  int index;
  OrderEntryRadioButton({required this.name, required this.index});
}