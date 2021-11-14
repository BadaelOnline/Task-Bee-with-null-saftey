import 'package:flutter/material.dart';

import '../main.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var lang = mySharedPreferences!.getString('lang');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Add currency'),
          onTap: () {
            Navigator.of(context).pushNamed('/currencyHome');
          },
        ),
        ListTile(
          title: const Text('Get Report'),
          onTap: () {
            Navigator.of(context).pushNamed('/reportSearch');
          },
        ),
        ListTile(
          title: const Text('language English'),
          onTap: () {
            setState(() {
              MyApp.of(context)!.setLocale('en');
              Navigator.of(context).pop();
            });
          },
        ),
        ListTile(
          title: const Text('language Arabic'),
          onTap: () {
            setState(() {
              MyApp.of(context)!.setLocale('ar');

              Navigator.of(context).pop();
            });
          },
        ),
        Text(lang.toString())
      ]),
    );
  }
}
