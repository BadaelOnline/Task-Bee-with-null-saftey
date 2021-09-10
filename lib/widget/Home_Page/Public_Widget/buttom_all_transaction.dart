import 'package:flutter/material.dart';

class Button_AllTransAction extends StatelessWidget {
  const Button_AllTransAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width * 1,
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
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            'All Transactions',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
