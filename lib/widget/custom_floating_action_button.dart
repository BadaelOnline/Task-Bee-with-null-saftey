import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Icon? icon;
  final Function()? onPressed;
  final String? text;
  const CustomFloatingActionButton({
    Key? key, this.icon, this.onPressed, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.amber[400],
                  onPressed: onPressed,
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 25,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(text!),
            ],
          ),
        ],
      ),
    );
  }
}