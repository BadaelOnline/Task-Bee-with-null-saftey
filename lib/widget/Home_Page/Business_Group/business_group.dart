import 'package:financial/common/applocal.dart';
import 'package:flutter/material.dart';
import 'icon_text.dart';

class Business_Project extends StatelessWidget {
  const Business_Project({
    Key? key,
  }) : super(key: key);

  final duoble = 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          icon_text(
            icon: Image.asset(
              'assets/homepage/work group.png',
              height: duoble,
              width: duoble,
            ),
            text: "${getLang(context, "Teams Managament")}",
          ),
          icon_text(
            icon: Image.asset(
              'assets/homepage/project.png',
              height: duoble,
              width: duoble,
            ),
            text: "${getLang(context, "Project")}",
          )
        ]),
      ),
    );
  }
}
