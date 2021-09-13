import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Text extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;
  const Custom_Text({
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
            autofocus: true,
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: onSubmit,
            onChanged: onChange,
            enabled: isClickable,
            onTap: onTap,
          ),
        ),
      ]),
    );
  }
}
