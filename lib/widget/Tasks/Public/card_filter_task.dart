import 'package:flutter/material.dart';

class CardFilterTask extends StatefulWidget {
  String imagee = '';
  Widget type;
  Function() ontap;
  Widget icon;

  CardFilterTask(
      {Key? key,
      required this.icon,
      required this.type,
      required this.ontap,
      required this.imagee})
      : super(key: key);

  @override
  _CardFilterTaskState createState() => _CardFilterTaskState();
}

class _CardFilterTaskState extends State<CardFilterTask> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        alignment: Alignment.center,
        height: 65,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 35,
                        width: 35,
                        child: Image.asset(widget.imagee),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: widget.type)
                  ],
                ),
                widget.icon
              ],
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
