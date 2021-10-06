import 'package:flutter/material.dart';

class checkbox_wallet extends StatelessWidget {
  const checkbox_wallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Hide Wallet'),
      value: false,
      onChanged: (val) {},
      checkColor: Colors.amber,
      subtitle: Text(
          'The wallet and its balance will be hidden You can create any transactions even unhide'),
    );
  }
}
