import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/values/endpoints.dart';
import '../../../../data/model/country_info.dart';
import '../../../../data/model/profile_picture.dart';
import '../../../../data/model/request_customer_token.dart';
import '../../../../data/model/user_id.dart';
import '../../../../data/model/user_info.dart';
import '../../../../data/model/user_token.dart';
import '../../../../data/provider/globals.dart';
import '../../../../data/services/api_service.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/function.dart';
import '../../../../utils/keyboard.dart';
import '../../../../utils/logger.dart';
import '../../../../utils/snackbar.dart';
import '../../../../utils/user_session.dart';
import '../../../../widgets/confirmation_dialog.dart';
import '../../../home/home.dart';

class LoginController extends GetxController {
  final store = GetStorage();

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String email = kReleaseMode ? "" : "2970466";
  late String password = kReleaseMode ? "" : "1234";
  RxBool remember = false.obs;
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isSessionExpired = false.obs;
  RxString errorMessages = ''.obs;
  final GlobalKey errorKey = GlobalKey();

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    _setCurrentMarket();
    if (data != null) {
      isSessionExpired.value = data as bool;
    }
  }

  void onPressContinue(BuildContext context) {
    errorMessages.value = "";
    if (userIdController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      isSessionExpired.value = false;
      formKey.currentState!.save();
      getLoginTokens(context);
      KeyboardUtil.hideKeyboard(context);
    } else {
      errorMessages.value = "Please enter valid user id & password";
      Scrollable.ensureVisible(errorKey.currentContext!,
          duration: const Duration(milliseconds: 500));
    }
  }

  String? inputValidate({required String value, required bool isPassword}) {
    if (value.isEmpty) {
      return isPassword ? kPassNullError : kUserIdNullError;
    }
    return null;
  }

  Future<void> openMailConfirmationDialog(BuildContext context) async {
    final isConfirmed = await ConfirmationDialog.show(
        context: context,
        title: "reset_password".tr,
        message: 'want_to_reset_password'.tr,
        okText: 'proceed'.tr,
        cancelText: 'no_thanks'.tr);
    if (isConfirmed == false) return;
    _composeMail();
  }

  Future<void> _composeMail() async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'smith@example.com',
        queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});
    final String _emailUriString =
        // ignore: unnecessary_string_escapes
        _emailLaunchUri.toString().replaceAll('+', '\%20');
    await launch(_emailUriString);
  }

  Future<void> getLoginTokens(BuildContext context) async {
    try {
      loading.toggle();
      final String credentials =
          "${userIdController.text}:${passwordController.text}";
      final Codec<String, String> stringToBase64 = utf8.fuse(base64);
      analytics.logLogin();
      final RequestPostCustomerToken request = RequestPostCustomerToken(
          namespace: '${Endpoints.baseUrl}customers',
          type: kEncodeType,
          value: stringToBase64.encode(credentials));

      //*  getLoginTokens from api
      final CustomerToken customerToken =
          await ApiService.init().getLoginTokens(request);
      await UserSessionManager.shared.setLoginTokenIntoDB(customerToken);

      //*  getCustomerData from api
      final UserInfo responseUserInfo = await ApiService.shared()
          .getCustomerData(UserSessionManager.shared.customerUniqueId);

      //* Get current market
      _setCurrentMarket(
          country: responseUserInfo.mainAddress.country.toLowerCase());

      //*  getCustomerData from api
      final ProfilePicture profilePicture = await ApiService.shared()
          .getProfilePicture(UserSessionManager.shared.customerUniqueId);

      //*  getCustomerData from api
      final UserId userResponse = await MemberCallsService.init()
          .getUserId(kUserId, userIdController.text);

      Globals.customerCode = customerToken.customer.href.getAfterLastSlash();
      Globals.profilePicture.value = profilePicture;
      Globals.emailAddress = responseUserInfo.email.obs;

      UserSessionManager.shared.customerId = userResponse.customerId;
      UserSessionManager.shared.customerCode = userResponse.customerCode;
      UserSessionManager.shared.customerPoCode = userResponse.customerPoCode;
      await UserSessionManager.shared.setUserInfoIntoDB(responseUserInfo);
      await UserSessionManager.shared.setLoginStatusIntoDB(true);
      await UserSessionManager.shared.setProfilePictureToDB(profilePicture);
      await UserSessionManager.shared.setCustomerIdInfo(userResponse);
      //*  navigate to home page
      loading.toggle();
      Get.off(() => MainHomeScreen(), transition: Transition.cupertino);
    } on DioError catch (e) {
      loading.toggle();
      if (e.response != null) {
        returnResponse(e.response!);
      } else {
        SnackbarUtil.showError(message: e.message);
      }
    } catch (err, stack) {
      loading.toggle();
      SnackbarUtil.showError(message: "error_getting_user_details".tr);
      LoggerService.instance.e(err.toString());
      LoggerService.instance.e(stack.toString());
    }
  }

  Future<Markets?> getMarketConfig(String country) async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/market_config.json');
      final data = await json.decode(response);
      if (data != null) {
        final marketInfo = AllMarkets.fromJson(data as Map<String, dynamic>);
        return marketInfo.markets
            .firstWhere((market) => market.code == country);
      }
    } catch (err) {
      LoggerService.instance.e(err.toString());
      return null;
    }
  }

  Future<void> _setCurrentMarket({String country = 'th'}) async {
    //*  get current market data from json file
    final Markets? currentMarket = await getMarketConfig(country); //! hardcoded
    if (currentMarket == null) {
      throw "your_market_is_not_supported".tr;
    }

    //*  Storing user info to db
    await store.write('current_market', currentMarket);
    Globals.currentMarket = currentMarket;
    Globals.currency = currentMarket.currencyCode;
  }

  void onClickForgotPassword() {
    Get.toNamed(Routes.FOROGT_PASSWORD);
  }
}