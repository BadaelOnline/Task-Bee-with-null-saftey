import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget icon;
  // final Widget sarecheIcon;
  // final Function search;
  // final Function trans;

  CustomAppBar(
    this.icon,
    // this.sarecheIcon,
    this.title,
    // this.search,
    // this.trans,
  );
  @override
  Size get preferredSize => Size.fromHeight(55);

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
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.search,
              //     color: Colors.grey[700],
              //   ),
              // ),
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
