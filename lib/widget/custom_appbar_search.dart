import 'package:flutter/material.dart';

class AppBarwithsearch extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? icon;
  const AppBarwithsearch({Key? key, required this.title, required this.icon})
      : super(
          key: key,
        );

  @override
  _AppBarwithsearchState createState() => _AppBarwithsearchState();
  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _AppBarwithsearchState extends State<AppBarwithsearch> {
  late final String title;
  late final Icon icon;
  TextEditingController _controller = new TextEditingController();

  Widget titletext = Text('title');
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: titletext,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: icon),
      ),
      actions: [
        Container(
          child: Row(
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.search,
              //     color: Colors.grey[700],
              //   ),
              // ),
              IconButton(
                icon: icon,
                onPressed: () {
                  setState(() {
                    if (icon == Icons.search) {
                      icon = new Icon(
                        Icons.close,
                        color: Colors.white,
                      );
                      titletext = TextField(
                        controller: _controller,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                            prefixIcon:
                                new Icon(Icons.search, color: Colors.white),
                            hintText: "Search...",
                            hintStyle: new TextStyle(color: Colors.white)),
                      );
                    } else {}
                  });
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/homepage/cancel.png',
                  scale: 6,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
