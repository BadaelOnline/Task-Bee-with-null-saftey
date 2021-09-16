import 'package:flutter/material.dart';
import 'muilty_icon_text.dart';

class Family_Health extends StatelessWidget {
  const Family_Health({
    Key? key,
  }) : super(key: key);

  final duoble = 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                multi_icon_text(
                  icon1: Image.asset(
                    'assets/homepage/pmi.png',
                    height: duoble,
                    width: duoble,
                  ),
                  icon2: Image.asset(
                    'assets/homepage/study.png',
                    height: duoble,
                    width: duoble,
                  ),
                  text1: 'BMI',
                  text2: 'Study',
                ),
                multi_icon_text(
                  icon1: Image.asset(
                    'assets/homepage/heart.png',
                    height: duoble,
                    width: duoble,
                  ),
                  icon2: Image.asset(
                    'assets/homepage/chilld.png',
                    height: duoble,
                    width: duoble,
                  ),
                  text1: 'Health',
                  text2: 'Children',
                ),
                multi_icon_text(
                  icon1: Image.asset(
                    'assets/homepage/medicen.png',
                    height: duoble,
                    width: duoble,
                  ),
                  icon2: Image.asset(
                    'assets/homepage/notes.png',
                    height: duoble,
                    width: duoble,
                  ),
                  text1: 'Medicine',
                  text2: 'Notes',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
