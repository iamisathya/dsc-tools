import 'package:get/get.dart';

import '../ui/global/no_connection.dart';
import '../ui/screens/barcode/barcode.screen.dart';
import '../ui/screens/barcode/screens/barcode_details.dart';
import '../ui/screens/easy_ship/easyship.screen.dart';
import '../ui/screens/enroll/enrollhome.screen.dart';
import '../ui/screens/enroll/screens/enroll_confirmation/enrollconfirmation.screen.dart';
import '../ui/screens/enroll/screens/order_complete/enrollcomplete.screen.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/inventory/inventory.dart';
import '../ui/screens/login/login.screen.dart';
import '../ui/screens/notifications/screens/home_screen.dart';
import '../ui/screens/open_po/order_create/home_screen.dart';
import '../ui/screens/open_po/order_details/home_screen.dart';
import '../ui/screens/open_po/order_list/home_screen.dart';
import '../ui/screens/open_po/order_success/main_screen.dart';
import '../ui/screens/order_entry/orderentry.screen.dart';
import '../ui/screens/order_entry/screens/checkout/checkout.screen.dart';
import '../ui/screens/profile/profile.dart';
import '../ui/screens/profile/screens/change_password/update_password.dart';
import '../ui/screens/profile/screens/forgot_password/forgot_password.dart';
import '../ui/screens/profile/screens/forgot_password/screens/change_password/change_password.dart';
import '../ui/screens/profile/screens/forgot_password/screens/verify_code/verify_code.dart';
import '../ui/screens/profile/screens/operation_result/operation_result.dart';
import '../ui/screens/profile/screens/terms_conditions/terms_conditions.dart';
import '../ui/screens/profile/screens/update_email/update_email.dart';
import '../ui/screens/sales_reports/component/print_report.dart';
import '../ui/screens/sales_reports/salesreports.screen.dart';
import '../ui/screens/settings/settings.screen.dart';
import '../ui/screens/splash/splash.screen.dart';
import '../ui/screens/webview/webview.screen.dart';
import '../utilities/bindings.dart';
import 'router.dart';
// import '../utilities/bindings.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    // splash
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    // Enroll
    GetPage(name: EnrollHomeScreen.routeName, page: () => EnrollHomeScreen()),
    GetPage(
        name: EnrollConfirmation.routeName, page: () => EnrollConfirmation()),
    GetPage(name: EnrollComplete.routeName, page: () => EnrollComplete()),
    GetPage(
        name: InventoryHomeScreen.routeName, page: () => InventoryHomeScreen()),
    // Easy ship
    GetPage(
        name: EasyShipHomeScreen.routeName, page: () => EasyShipHomeScreen()),
    // Order Entry
    GetPage(
        name: OrderEntryHomeScreen.routeName,
        page: () => OrderEntryHomeScreen()),
    // Dashbaord
    GetPage(name: MainHomeScreen.routeName, page: () => MainHomeScreen()),
    // Login
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(name: CheckoutPage.routeName, page: () => CheckoutPage()),
    // Settings
    GetPage(name: SettingsPage.routeName, page: () => SettingsPage()),
    // Open PO
    GetPage(name: OpenPoHomeScreen.routeName, page: () => OpenPoHomeScreen()),
    GetPage(
        name: OpenPoOrderDetails.routeName, page: () => OpenPoOrderDetails()),
    GetPage(name: OpenPoCreateOrder.routeName, page: () => OpenPoCreateOrder()),
    GetPage(
        name: CreateOpenPoOrderResult.routeName,
        page: () => CreateOpenPoOrderResult()),
    // Sales Report
    GetPage(name: PrintSalesReport.routeName, page: () => PrintSalesReport()),
    GetPage(
        name: SalesReportsHomeScreen.routeName,
        page: () => SalesReportsHomeScreen()),
    // Barcode
    GetPage(name: BarCodeDetails.routeName, page: () => BarCodeDetails()),
    GetPage(name: BarcodeHomeScreen.routeName, page: () => BarcodeHomeScreen()),
    // Common pages
    GetPage(
        name: WebivewHomeScreen.routeName,
        page: () => const WebivewHomeScreen()),
    GetPage(name: UserProfileScreen.routeName, page: () => UserProfileScreen()),
    // profile pages
    GetPage(
        name: ScreenPaths.termsConditions,
        page: () => const TermsConditionsScreen(),
        binding: TermsConditionsBinding()),
    GetPage(
        name: ScreenPaths.updateEmail,
        page: () => UpdateEmailScreen(),
        binding: UpdateEmailBinding()),
    GetPage(
        name: ScreenPaths.updateEmail,
        page: () => UpdateEmailScreen(),
        binding: UpdateEmailBinding()),
    GetPage(
        name: ScreenPaths.updatePassword,
        page: () => UpdatePasswordScreen(),
        binding: UpdatePasswordBinding()),
    GetPage(
        name: ScreenPaths.userProfile,
        page: () => UserProfileScreen(),
        binding: UserProfileBinding()),
    GetPage(
        name: ScreenPaths.notifications,
        page: () => const NotificationsScreen(),
        binding: NotificationsBinding()),
    GetPage(
        name: ScreenPaths.noConnection,
        page: () => NoConnectionScreen(),
        binding: NoConnectionBinding()),
    GetPage(
        name: ScreenPaths.forgotPassword,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: ScreenPaths.verifyCode,
        page: () => VerifyCodeScreen(),
        binding: VerifyCodeBinding()),
    GetPage(
        name: ScreenPaths.changePassword,
        page: () => ChangePasswordScreen(),
        binding: ChangePasswordBinding()),
    GetPage(
        name: ScreenPaths.operationResult, page: () => OperationResultScreen()),
  ];
}
