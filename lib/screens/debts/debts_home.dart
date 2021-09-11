import 'package:financial/common/constant/constants.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DebtsHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(Icon(Icons.ice_skating),'Debts') ,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: kDefaultPrimaryColor,
                  onPressed: () {  },
                ),
                SizedBox(
                  height: 10,
                ),

                Text('add debt')
              ],
            ),
          ],
        ),
      ),
    );

  }
}