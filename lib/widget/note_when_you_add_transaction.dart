// ignore: camel_case_types
import 'package:taskBee/common/applocal.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Note_when_you_add_transaction extends StatefulWidget {
  const Note_when_you_add_transaction({
    Key? key,
    this.des,
  }) : super(key: key);
  final TextEditingController? des;

  @override
  _Note_when_you_add_transactionState createState() =>
      _Note_when_you_add_transactionState(des);
}

// ignore: camel_case_types
class _Note_when_you_add_transactionState
    extends State<Note_when_you_add_transaction> {
  final TextEditingController? descreptionController;
  _Note_when_you_add_transactionState(this.descreptionController);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 13.7;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              Icons.list,
              size: 30,
              color: Colors.grey[500],
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: descreptionController,
              textAlign: TextAlign.start,
              decoration: new InputDecoration(
                hintText: "${getLang(context, "Add some note")}".toString(),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
