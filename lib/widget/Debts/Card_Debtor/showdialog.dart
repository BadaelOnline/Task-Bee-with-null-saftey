import 'package:flutter/material.dart';

Future<void> ShowDialogdebtor(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Recepit ',
        style: TextStyle(color: Colors.green),
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
                  onTap: () =>
                      Navigator.of(context).pushNamed('/recepitdebtor'),
                ),
                Divider(),
                InkWell(
                  child: Text(
                    'Installment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () =>
                      Navigator.of(context).pushNamed('/recepitdebtor'),
                ),
                Divider(),
                InkWell(
                  child: Text(
                    'Amount',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () =>
                      Navigator.of(context).pushNamed('/recepitdebtor'),
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
