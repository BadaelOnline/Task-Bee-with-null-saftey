import 'package:flutter/material.dart';

import '../../main.dart';

class CardContact extends StatelessWidget {
  final Function()? delete;
  final Function()? edit;
  final Function()? onTap;
  final String? name;

  const CardContact({
    Key? key,
    this.delete,
    this.edit,
    this.name,
    this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 11;
    var lang = mySharedPreferences!.getString('lang');
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: lang == 'en' ? 8 : 0,
                        right: lang == 'en' ? 0 : 8),
                    child: Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 35,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 12,
                ),
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ]),
              Row(children: [
                IconButton(
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.grey[500],
                  ),
                  onPressed: edit,
                ),
              ]),
            ],
          )),
    );
  }
}
