import 'package:flutter/material.dart';

class ButtonAddCancel extends StatefulWidget {
  final Function() add;
  final Function() cancel;
  const ButtonAddCancel({Key? key, required this.add, required this.cancel})
      : super(key: key);

  @override
  _ButtonAddCancelState createState() => _ButtonAddCancelState();
}

class _ButtonAddCancelState extends State<ButtonAddCancel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: widget.add,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 50,
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff494949)),
                ),
              ),
            ),
            Container(
              height: 30,
              child: VerticalDivider(
                color: Color(0xff949494),
                thickness: 1,
              ),
            ),
            InkWell(
              onTap: widget.cancel,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 50,
                child: Text('Cancel',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff494949))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
