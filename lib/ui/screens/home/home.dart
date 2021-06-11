import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/theme/bloc.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = '/mainHomePage';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _changeLanguage(String lang) {
  
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
      items: [
        PopupMenuItem<Widget>(
          child: ListTile(
            leading: const IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: const Text("English"),
            onTap: () => _changeLanguage("EN"),
          ),
        ),
        PopupMenuItem<Widget>(
          child: ListTile(
            leading: const IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: const Text("Thai"),
            onTap: () => _changeLanguage("TH"),
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.mode_night_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: () => themeBloc.toggleThemeMode,
            ),
            IconButton(
              icon: const Icon(
                Icons.translate_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: () => _showPopupMenu(context),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Center());
  }
}
