import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/find_customer.dart';
import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/models/search_customer.dart';
import 'package:dsc_tools/models/search_reponse_by_href.dart';
import 'package:dsc_tools/models/user_minimal_data.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/order_entry_list/home.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/parsing.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryUserListController extends GetxController {
  TextEditingController searchUserTextController = TextEditingController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> searchOptions = [
    NameValueType(name: "With BA Number", value: "baId"),
    NameValueType(name: "with Govt ID, Name", value: "govtIdOrName"),
  ].obs;
  RxString filterMethod = "baId".obs;
  RxBool isLoading = false.obs;
  RxBool isFetching = false.obs;
  RxList<String> searchedUsers = <String>["Hi", "Sathya"].obs;
  final selecteduserIndex = Rxn<int>();
  SearchCustomer searchedResultsOfHref = SearchCustomer(items: []);
  FindCustomer searchedGuestUserInfo = FindCustomer(items: []);
  RxList<SearchedUserInfo> searchResultsOfUserInfo = <SearchedUserInfo>[].obs;
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "order_entry");
    super.onInit();
  }

  Future<void> searchUserBySearchQuery() async {
    if (searchUserTextController.text.isEmpty) {
      SnackbarUtil.showWarning(message: "User id shouldn't be empty.");
      return;
    }
    if (filterMethod.value == "baId") {
      searchUserById();
      searchResultsOfUserInfo.clear();
    } else {
      searchUserBySearchKey();
      searchResultsOfUserInfo.clear();
    }
  }

  Future<void> searchUserById() async {
    try {
      // * search for users by user id(search key)
      isLoading.toggle();
      searchedGuestUserInfo = await ApiService.shared().findCustomer(
          Parsing.intFrom(searchUserTextController.text)!, "customer");
      if (searchedGuestUserInfo.items.isNotEmpty) {
        // Move to details page
        final CustomerData foundUser = searchedGuestUserInfo.items[0];
        final UserMinimalData user = UserMinimalData(
            fullName: foundUser.humanName.fullName,
            email: foundUser.email,
            userId: foundUser.id.unicity);
        Get.to(() => OrderEntryList(), arguments: user);
      }
      isLoading.toggle();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err, s) {
      _onCatchError(err, s);
    }
  }

  Future<void> searchUserBySearchKey() async {
    isLoading.toggle();
    try {
      // * search for users by user id(search key)
      searchedResultsOfHref = await ApiService.shared()
          .searchCustomer(searchUserTextController.text, 1);
      if (searchedResultsOfHref.items.isNotEmpty) {
        final List<String> data =
            searchedResultsOfHref.items.map((e) => e.href).toList();
        searchUsersByHref(data);
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err, s) {
      _onCatchError(err, s);
    }
  }

  Future<void> searchUsersByHref(List<String> results) async {
    try {
      // * search for users by user id(search key)
      searchResultsOfUserInfo.value = await MemberCallsService.init()
          .searchUsersByHref("getBAInfo", results);
      isLoading.toggle();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err, s) {
      _onCatchError(err, s);
    } finally {
      update();
    }
  }

  String _getErrorMessage(dynamic error) {
    // final errorObj = jsonDecode(error.toString());
    final mappedObj = error as Map<String, dynamic>;
    return mappedObj["error"]["error_message"].toString();
  }

  void _onDioError(DioError e) {
    isLoading.toggle();
    debugPrint(e.toString());
    final message = _getErrorMessage(e.response!.data);
    SnackbarUtil.showError(message: message);
    returnResponse(e.response!);
  }

  void _onCatchError(Object err, StackTrace s) {
    debugPrint(err.toString());
    SnackbarUtil.showError(message: "Error while getting user details!");
    LoggerService.instance.e(s);
    isLoading.toggle();
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    searchUserTextController.text = "";
    filterMethod.value = searchOptions[index].value;
    // getAllOpenPo();
  }

  void onSelectUser(int idx) {
    searchUserTextController.text =
        searchResultsOfUserInfo[idx].humanName.fullName;
    selecteduserIndex.value = idx;
    searchResultsOfUserInfo.refresh();
    isFetching.toggle();
    Future.delayed(const Duration(milliseconds: 1200), () {
      final SearchedUserInfo selectedUser = searchResultsOfUserInfo[idx];
      final UserMinimalData userData = UserMinimalData(
          fullName: selectedUser.humanName.fullName,
          email: selectedUser.email,
          userId: selectedUser.id.unicity.toString());
      isFetching.toggle();
      searchUserTextController.text = "";
      Get.to(() => OrderEntryList(), arguments: userData);
    });
  }

  void onCancel() {
    Get.back();
  }

  void onProceedNext() {
    if (searchUserTextController.text.isNotEmpty) {
      searchUserBySearchQuery();
      return;
    }
    SnackbarUtil.showWarning(message: "Please enter/select user id first!");
  }
}
