import 'package:flutter/material.dart';

class Text_Namewallet extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;

  const Text_Namewallet({
    Key? key,
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.label,
    this.prefix,
    this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          child: Text(
            label.toString(),
            style: TextStyle(fontSize: 15),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
        ),
        Center(
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                controller: controller,
                keyboardType: type,
                onFieldSubmitted: onSubmit,
                onChanged: onChange,
                enabled: isClickable,
                onTap: onTap,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
