import 'package:financial/models/contact.dart';
import 'package:financial/models/exchange_category.dart';
import 'package:financial/models/transaction.dart';
import 'package:financial/models/wallet.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateRevenues extends StatelessWidget {
  Transaction? transaction;

  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController restController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();




  UpdateRevenues({Key? key, this.transaction}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    transaction = arguments['transaction'];
    return Scaffold(
      appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Update Revenues'),
      body:BlocConsumer<TransactionCubit,TransactionStates>(
        listener: (context,state){
          if(state is UpdateTransactionsToDatabaseState){
            Navigator.of(context).pop();
          }
        },
        builder: (context,state){
          TransactionCubit cubit = TransactionCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                 label : 'total transaction',

                 controller : totalController=
                     TextEditingController(text: '${transaction!.total}'),
                 prefix: Icons.person,
                 type :TextInputType.number),
              SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                  label :'paid',
                  controller :paidController=
                      TextEditingController(text: '${transaction!.paid}'),
                  prefix:Icons.person,
                  type :TextInputType.number),
              // SizedBox(
              //   height: 50,
              // ),
              // CustomTextFormField(
              //     label :'rest',
              //     controller :restController=
              //         TextEditingController(text: '${transaction!.rest}'),
              //     prefix:Icons.person,
              //     type :TextInputType.number),
              SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                  label :'transactionDate',
                  controller :transactionDateController=
                      TextEditingController(text: '${transaction!.transactionDate}'),
                  prefix: Icons.date_range,
                  type :TextInputType.text),
              SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                  label :'description',
                  controller :descriptionController=
                      TextEditingController(text: '${transaction!.description}'),
                  prefix: Icons.description,
                  type :TextInputType.text),
              SizedBox(
                height: 50,
              ),
              // CustomTextFormField(
              //     label :'isIncome',
              //     controller :isIncomeController,
              //     prefix: Icons.person,
              //     type :TextInputType.number),
              // SizedBox(
              //   height: 50,
              // ),
              BlocConsumer<ExchangeCubit,ExchangeStates>(
                listener: (context,ExchangeStates state){},
                builder:(context,ExchangeStates state){
                  var x = ExchangeCubit.get(context);
                  // ignore: unrelated_type_equality_checks
                  return TextField(
                    // onSubmitted: (value) => _childInfo(context),
                    textAlign: TextAlign.right,
                    readOnly: true,
                    controller: exchangeIdController=TextEditingController(
                        text: '${x.getExchangeName(exchangeId: transaction!.exchangeId)}'),
                    style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      labelStyle: new TextStyle(
                        color: Colors.amberAccent,

                      ),
                      focusedBorder:UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amberAccent),
                      ),
                      prefixIcon: new DropdownButton<String>(
                        underline: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.transparent))
                          ),
                        ),
                        icon: new Icon(Icons.keyboard_arrow_down),
                        items: x.exchanges!.map((ExchangeCategory value) {
                          return new DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name) ,
                          );
                        }).toList(),
                        onChanged: (String? value){
                          exchangeIdController.text =value!;
                        },
                      ),
                      hintText: 'Exchange Category',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                      hoverColor: Colors.amberAccent,
                      focusColor: Colors.amberAccent,
                    ),
//                        onSubmitted: (value) =>  Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
                  );
                } ,
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<ContactCubit,ContactStates>(
                listener: (context,ContactStates state){},
                builder:(context,ContactStates state){
                  var x = ContactCubit.get(context);
                  // ignore: unrelated_type_equality_checks
                  return TextField(
                    // onSubmitted: (value) => _childInfo(context),
                    textAlign: TextAlign.right,
                    readOnly: true,
                    controller: contactIdController=TextEditingController(
                        text: '${x.getContactName(contactId: transaction!.contactId)}'),
                    style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      labelStyle: new TextStyle(
                        color: Colors.amberAccent,

                      ),
                      focusedBorder:UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amberAccent),
                      ),
                      prefixIcon: new DropdownButton<String>(
                        underline: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.transparent))
                          ),
                        ),
                        icon: new Icon(Icons.keyboard_arrow_down),
                        items: x.contacts!.map((Contact value) {
                          return new DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name) ,
                          );
                        }).toList(),
                        onChanged: (String? value){
                          contactIdController.text =value!;
                        },
                      ),
                      hintText: 'Contact',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                      hoverColor: Colors.amberAccent,
                      focusColor: Colors.amberAccent,
                    ),
//                        onSubmitted: (value) =>  Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
                  );
                } ,
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<WalletCubit,WalletStates>(
                listener: (context,WalletStates state){},
                builder:(context,WalletStates state){
                  var x = WalletCubit.get(context);
                  // ignore: unrelated_type_equality_checks
                  return TextField(
                    // onSubmitted: (value) => _childInfo(context),
                    textAlign: TextAlign.right,
                    readOnly: true,
                    controller: walletIdController=TextEditingController(
                        text: '${x.getWalletName(walletId: transaction!.walletId)}'),
                    style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      labelStyle: new TextStyle(
                        color: Colors.amberAccent,

                      ),
                      focusedBorder:UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amberAccent),
                      ),
                      prefixIcon: new DropdownButton<String>(
                        underline: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.transparent))
                          ),
                        ),
                        icon: new Icon(Icons.keyboard_arrow_down),
                        items: x.wallets!.map((Wallet value) {
                          return new DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name) ,
                          );
                        }).toList(),
                        onChanged: (String? value){
                          walletIdController.text =value!;
                        },
                      ),
                      hintText: 'Wallet',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                      hoverColor: Colors.amberAccent,
                      focusColor: Colors.amberAccent,
                    ),
                  );
                } ,
              ),
              SizedBox(
                height: 50,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  child: Text('save'),
                  onPressed: () {
                    if(transaction!.walletId == WalletCubit.get(context)
                        .getWalletId(walletName: walletIdController.text)){
                      if(int.parse(transaction!.total) != int.parse(totalController.text)){
                        cubit.updateTransactionDatabase(
                            isId: transaction!.id,
                            contactId: ContactCubit.get(context).getContactId(contactName: contactIdController.text),
                            description: descriptionController.text,
                            exchangeId: ExchangeCubit.get(context).getExchangeId(exchangeName: exchangeIdController.text),
                            paid: paidController.text,
                            rest: '${int.parse(totalController.text) - int.parse(paidController.text)}',
                            total: totalController.text,
                            transactionDate: transactionDateController.text,
                            walletId: WalletCubit.get(context).getWalletId(walletName: walletIdController.text),
                            income: 0
                        );
                        Wallet? wallet = WalletCubit.get(context).getWallet(walletId: transaction!.walletId);
                        int newBalance = int.parse(wallet!.balance) - int.parse(transaction!.total) + int.parse(totalController.text);
                        WalletCubit.get(context).updateWalletDatabase(
                            isId: wallet.id,
                            walletName: wallet.name,
                            walletBalance: '$newBalance',
                            currencyId: wallet.currencyId,
                            icon: wallet.icon
                        );
                      }
                      else{
                        cubit.updateTransactionDatabase(
                            isId: transaction!.id,
                            contactId: ContactCubit.get(context).getContactId(contactName: contactIdController.text),
                            description: descriptionController.text,
                            exchangeId: ExchangeCubit.get(context).getExchangeId(exchangeName: exchangeIdController.text),
                            paid: paidController.text,
                            rest: '${int.parse(totalController.text) - int.parse(paidController.text)}',
                            total: totalController.text,
                            transactionDate: transactionDateController.text,
                            walletId: WalletCubit.get(context).getWalletId(walletName: walletIdController.text),
                            income: 0
                        );
                      }
                    }
                    else{
                      cubit.updateTransactionDatabase(
                          isId: transaction!.id,
                          contactId: ContactCubit.get(context).getContactId(contactName: contactIdController.text),
                          description: descriptionController.text,
                          exchangeId: ExchangeCubit.get(context).getExchangeId(exchangeName: exchangeIdController.text),
                          paid: paidController.text,
                          rest: '${int.parse(totalController.text) - int.parse(paidController.text)}',
                          total: totalController.text,
                          transactionDate: transactionDateController.text,
                          walletId: WalletCubit.get(context).getWalletId(walletName: walletIdController.text),
                          income: 0
                      );
                      Wallet? oldWallet = WalletCubit.get(context).getWallet(walletId: transaction!.walletId);
                      Wallet? newWallet = WalletCubit.get(context).getWallet(walletId: WalletCubit.get(context)
                          .getWalletId(walletName: walletIdController.text));
                      int newBalanceForOldWallet = int.parse(oldWallet!.balance) - int.parse(transaction!.total);
                      int newBalanceForNewWallet = int.parse(newWallet!.balance) + int.parse(totalController.text);
                      WalletCubit.get(context).updateWalletDatabase(
                          isId: oldWallet.id,
                          walletName: oldWallet.name,
                          walletBalance: '$newBalanceForOldWallet',
                          currencyId: oldWallet.currencyId,
                          icon: oldWallet.icon
                      );
                      WalletCubit.get(context).updateWalletDatabase(
                          isId: newWallet.id,
                          walletName: newWallet.name,
                          walletBalance: '$newBalanceForNewWallet',
                          currencyId: newWallet.currencyId,
                          icon: newWallet.icon
                      );
                    }




                  })
            ]),
          );
        },
      ),
    );
  }
}

