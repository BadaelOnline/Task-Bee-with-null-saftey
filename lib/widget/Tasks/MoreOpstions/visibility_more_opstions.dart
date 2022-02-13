import 'dart:math';

import 'package:flutter/material.dart';

import 'add_aleart/add_aleart.dart';
import 'add_contacts/add_contact.dart';
import 'add_important/add_important.dart';
import 'add_nots/add_nots.dart';
import 'add_place/add_places.dart';
import 'add_repate/add_repate.dart';

class VisibilityMoreOptions extends StatefulWidget {
  const VisibilityMoreOptions({Key? key}) : super(key: key);

  @override
  _VisibilityMoreOptionsState createState() => _VisibilityMoreOptionsState();
}

class _VisibilityMoreOptionsState extends State<VisibilityMoreOptions> {
  bool visibile = false;
  double h = 15.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              visibile = !visibile;
            });
          },
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  visibile == false ? 'More Options' : 'Less Opstions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Transform.rotate(
                  angle: visibile == false ? 90 * pi / 180 : -90 * pi / 180,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Visibility(
          visible: visibile,
          child: Column(
            children: [
              AddAleart(),
              SizedBox(
                height: h,
              ),
              AddRepated(),
              SizedBox(
                height: h,
              ),
              AddImportant(),
              SizedBox(
                height: h,
              ),
              AddNots(),
              SizedBox(
                height: h,
              ),
              AddContact_Tasks(),
              SizedBox(
                height: h,
              ),
              AddPlaces(),
              SizedBox(
                height: h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
