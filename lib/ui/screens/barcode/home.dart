import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/barcode/components/body.dart';
import 'package:flutter/material.dart';

class BarcodeHomeScreen extends StatefulWidget {
  static const String routeName = '/barcodeHomePage';

  @override
  _BarcodeHomeScreenState createState() => _BarcodeHomeScreenState();
}

class _BarcodeHomeScreenState extends State<BarcodeHomeScreen> {
  TextEditingController searchConntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TransAppBar(
          title: "BarCode",
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
