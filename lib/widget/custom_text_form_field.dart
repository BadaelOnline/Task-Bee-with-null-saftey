import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final  onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;
  const CustomTextFormField({
    Key? key, this.controller, this.type, this.onSubmit, this.onChange, this.onTap, this.label, this.prefix, this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      enabled: isClickable,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(),
      ),
    );
  }
}