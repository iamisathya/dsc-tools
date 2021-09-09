import 'package:dsc_tools/ui/screens/login/login.screen.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  
  void onLogout(BuildContext context) {
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    Get.offAll(() => LoginScreen());
  }
}