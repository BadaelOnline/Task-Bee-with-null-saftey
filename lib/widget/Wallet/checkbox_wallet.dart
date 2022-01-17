import 'package:taskBee/common/applocal.dart';
import 'package:flutter/material.dart';

class checkbox_wallet extends StatefulWidget {
  const checkbox_wallet({
    Key? key,
  }) : super(key: key);

  @override
  _checkbox_walletState createState() => _checkbox_walletState();
}

class _checkbox_walletState extends State<checkbox_wallet> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        "${getLang(context, "Hide Wallet")}",
      ),
      value: value,
      tristate: value,
      onChanged: (val) {
        setState(() {
          value = !value;
        });
      },
      checkColor: Colors.amber,
      activeColor: Colors.grey[300],
      subtitle: Text(
        "${getLang(context, "title hide wallet")}",
      ),
    );
  }
}
