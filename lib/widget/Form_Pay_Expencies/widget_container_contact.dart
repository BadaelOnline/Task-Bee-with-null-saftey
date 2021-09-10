import 'package:flutter/material.dart';

class widget_Container_contact extends StatelessWidget {
  const widget_Container_contact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 10),
            child: Container(
              child: Image.asset('assets/homepage/person.png'),
              width: 40,
              height: 40,
            ),
          ),
          Text('Contact')
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,

              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            )
          ]),
    );
  }
}
