import 'package:flutter/material.dart';
import 'package:taskBee/widget/Tasks/Public/button_add_cancel.dart';
import '../../card_of_visible_add_task.dart';

class AddAleart extends StatefulWidget {
  const AddAleart({Key? key}) : super(key: key);

  @override
  _AddAleartState createState() => _AddAleartState();
}

class _AddAleartState extends State<AddAleart> {
  String? addaleart;
  List<String> checkedtext = [];
  List<String> _texts = [
    "at the same time",
    "befor 15 minute",
    "befor 30 minute",
    "befor one hour",
    "befor on day",
  ];

  List<bool> _isChecked = [];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return CardOfVisibibleAddTask(
        ontap: () {
          setState(() {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, setStatee) {
                    return Container(
                      color: Color(0xFF737373),
                      child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Flexible(
                                child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: ListView.builder(
                                      itemCount: _texts.length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          title: Text(_texts[index],
                                              style: TextStyle(
                                                  color: Color(0xff5A5A5A),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          value: _isChecked[index],
                                          onChanged: (val) {
                                            setStatee(
                                              () {
                                                _isChecked[index] = val!;
                                                _isChecked[index] == true
                                                    ? checkedtext
                                                        .add(_texts[index])
                                                    : checkedtext
                                                        .remove(_texts[index]);
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ))),
                            ButtonAddCancel(
                              add: () {
                                setState(() {
                                  checkedtext.length <= 2
                                      ? addaleart = checkedtext.join(" , ")
                                      : addaleart = checkedtext[0] +
                                          " , " +
                                          checkedtext[1];
                                  Navigator.of(context).pop();
                                });
                              },
                              cancel: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  });
                });
          });
        },
        title: checkedtext.length == 0
            ? Text('add aleart',
                style: TextStyle(
                    color: Color(0xff5A5A5A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15))
            : Text(addaleart.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
        image: 'assets/Tasks/bell.png');
  }
}
