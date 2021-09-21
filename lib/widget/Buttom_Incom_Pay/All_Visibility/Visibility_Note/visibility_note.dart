import 'package:flutter/material.dart';

import '../widget_container.dart';

// ignore: camel_case_types
class Visibility_Note extends StatefulWidget {
  const Visibility_Note({Key? key, this.des}) : super(key: key);
  final TextEditingController? des;

  @override
  _Visibility_NoteState createState() => _Visibility_NoteState(des);
}

// ignore: camel_case_types
class _Visibility_NoteState extends State<Visibility_Note> {
  final TextEditingController? descreptionController;
  bool isVisabile4 = false;

  _Visibility_NoteState(this.descreptionController);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isVisabile4 = !isVisabile4;
            });
          },
          child: Widget_container(
            text: 'Description',
          ),
        ),
        Visibility(
          visible: isVisabile4,
          child: Padding(
            padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your note',
                ),
                controller: descreptionController,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
