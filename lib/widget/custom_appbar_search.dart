import 'package:flutter/material.dart';

class CustomAppBar_Search extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget icon;
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.grey,
  );
  Widget customSearchBar = const Text('My Personal Journal');
  // final Widget sarecheIcon;
  // final Function search;
  // final Function trans;

  CustomAppBar_Search(
    this.icon,
    // this.sarecheIcon,
    this.title,
    // this.search,
    // this.trans,
  );
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: icon),
      ),
      actions: [
        Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = const ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'type in journal name...',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      customIcon = const Icon(Icons.search);
                      customSearchBar = customSearchBar;
                    }
                  },
                  icon: customIcon),
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
