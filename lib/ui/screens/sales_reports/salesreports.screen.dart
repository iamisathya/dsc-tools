import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreports.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../../utilities/constants.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'component/body.dart';

class SalesReportsHomeScreen extends StatelessWidget {
  final SalesReportController controller = Get.put(SalesReportController());
  static const String routeName = '/salesReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "Sales Report",
          action: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.open_in_new_outlined,
        ),
        tooltip: 'Export',
        onPressed: () => controller.onTapExportExcellSheet(),
      ),
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'Print',
        onPressed: () => controller.onTapPrintExcellSheet(),
      ),
      IconButton(
        icon: const Icon(
          Icons.sort,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }
}
