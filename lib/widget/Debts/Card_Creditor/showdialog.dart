import 'package:flutter/material.dart';

Future<void> ShowDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Pay ',
        style: TextStyle(color: Colors.red),
      ),
      content: Container(
        height: 152,
        child: Column(
          children: [
            Column(
              children: [
                InkWell(
                  child: Text(
                    'Total Debt',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/paycreditor'),
                ),
                Divider(),
                InkWell(
                  child: Text(
                    'Installment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/paycreditor'),
                ),
                Divider(),
                InkWell(
                  child: Text(
                    'Amount',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/paycreditor'),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    ),
  );
}
