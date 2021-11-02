import 'package:flutter/material.dart';

import '../main.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

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
            MyApp.of(context)!
                .setLocale(Locale.fromSubtags(languageCode: 'en'));
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('language Arabic'),
          onTap: () {
            MyApp.of(context)!
                .setLocale(Locale.fromSubtags(languageCode: 'ar'));
            Navigator.of(context).pop();
          },
        ),
      ]),
    );
  }
}
