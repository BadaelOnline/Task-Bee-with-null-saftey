import 'package:flutter/material.dart';

class CustomAppBarTask extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget icon;
  final Function() ontap;

  CustomAppBarTask(
    this.icon,
    this.title,
    this.ontap,
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
              ElevatedButton(
                onPressed: ontap,
                child: Text(
                  'Save',
                  style: TextStyle(color: Color(0xff5A5A5A)),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
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
