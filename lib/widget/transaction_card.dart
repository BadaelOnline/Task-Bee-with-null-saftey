import 'package:taskBee/models/financial_report.dart';
import 'package:flutter/material.dart';


class ReportItem extends StatelessWidget {
  final FinancialReport? report;
  const ReportItem({
    Key? key, this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Card(
    
      key: Key(report!.transactionId.toString()),
    
      child:   Padding(
    
        padding: const EdgeInsets.all(20.0),
    
        child:SingleChildScrollView(
    
          child: ListBody(
    
            children:  <Widget>[
    
              Text('wallet is: ${report!.walletName}'),
    
              Text('total is : ${report!.transactionTotal} .'),
    
              Text('rest is : ${report!.transactionRest} .'),
    
              Text('paid is : ${report!.transactionPaid} .'),
    
              Text('desc is : ${report!.transactionDescription} .'),
    
              Text('date is : ${report!.transactionDate} .'),
    
              Text('contact is : ${report!.contactName} .'),
    
              Text('category is : ${report!.exchangeCategoryName} .'),
    
            ],
    
          ),
    
        ),
    
      ),
    
      // onDismissed: (direction){
    
      //   AppCubit.get(context).deleteData(id: model['id']);
    
      // },
    
    );
  }
}