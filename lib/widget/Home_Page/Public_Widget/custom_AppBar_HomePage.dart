import 'package:flutter/material.dart';

class Basel extends StatelessWidget {
  const Basel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.grey[600],
      ),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset(
                'assets/homepage/navigation.png',
                height: 25,
                width: 25,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/homepage/logo-task-bee.png',
                height: 110,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
