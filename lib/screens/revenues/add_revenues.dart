// import 'package:financial/models/contact.dart';
// import 'package:financial/models/exchange_category.dart';
// import 'package:financial/models/wallet.dart';
// import 'package:financial/services/bloc/contact/cubit.dart';
// import 'package:financial/services/bloc/contact/states.dart';
// import 'package:financial/services/bloc/datepicker/cubit.dart';
// import 'package:financial/services/bloc/datepicker/state.dart';
// import 'package:financial/services/bloc/exchang_category/cubit.dart';
// import 'package:financial/services/bloc/exchang_category/states.dart';
// import 'package:financial/services/bloc/transaction/cubit.dart';
// import 'package:financial/services/bloc/transaction/states.dart';
// import 'package:financial/services/bloc/wallet/cubit.dart';
// import 'package:financial/services/bloc/wallet/states.dart';
// import 'package:financial/widget/custom_appBar.dart';
// import 'package:financial/widget/custom_Text_Total.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';


// // ignore: must_be_immutable
// class AddRevenues extends StatelessWidget {
//   TextEditingController totalController = TextEditingController();
//   TextEditingController paidController = TextEditingController();
//   TextEditingController transactionDateController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController exchangeIdController = TextEditingController();
//   TextEditingController walletIdController = TextEditingController();
//   TextEditingController contactIdController = TextEditingController();
//   String? date;
//   String? time;

//   TimeOfDay timeOfDay = TimeOfDay.now();
//   selectedTodotime(BuildContext context) async {
//     var pickTime = await showTimePicker(
//       context: context,
//       initialTime: timeOfDay,
//     );
//     if (pickTime != null) {
//       timeOfDay = pickTime;
//       time = TimeOfDay(hour: pickTime.hour, minute: pickTime.minute)
//           .format(context);
//       DatePickerCubit.get(context).choseDate(date: date, time: time);
//     }
//   }

//   DateTime dateTime = DateTime.now();
//   selectedTodoDate(BuildContext context) async {
//     var pickedDate = await showDatePicker(
//       context: context,
//       initialDate: dateTime,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (pickedDate != null) {
//       dateTime = pickedDate;
//       date = DateFormat('yyyy-MM-dd').format(pickedDate);
//       DatePickerCubit.get(context).choseDate(date: date, time: time);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Add Revenues'),
//       body: BlocConsumer<TransactionCubit, TransactionStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ListView(children: [
//               SizedBox(
//                 height: 5,
//               ),
//               CustomTextFormField(
//                   label: 'total transaction',
//                   controller: totalController,
//                   type: TextInputType.number),
//               SizedBox(
//                 height: 25,
//               ),
//               CustomTextFormField(
//                   label: 'Paid',
//                   controller: paidController,
//                   type: TextInputType.number),
//               SizedBox(
//                 height: 25,
//               ),
//               CustomTextFormField(
//                   label: 'description',
//                   controller: descriptionController,
//                   prefix: Icons.description,
//                   type: TextInputType.text),
//               SizedBox(
//                 height: 50,
//               ),

//               // BlocConsumer<DatePickerCubit, DatePickerStates>(
//               //   listener: (context, state) {
//               //
//               //   },
//               //   builder: (context, state) {
//               //     return CustomTextFormField(
//               //         label: 'Date and Time',
//               //         controller: transactionDateController=
//               //             TextEditingController(text: '${DatePickerCubit.get(context).chosenDate}'),
//               //         isClickable: false,
//               //         type: TextInputType.datetime);
//               //   },
//               // ),
//               SizedBox(
//                 height: 25,
//               ),
//               BlocConsumer<DatePickerCubit, DatePickerStates>(
//                 listener: (context, state) {
//                   if (state is ChoseDateState) {
//                     transactionDateController.text =
//                         DatePickerCubit.get(context).chosenDate!;
//                   }
//                 },
//                 builder: (context, state) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width * 0.4,
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: Colors.amber[400]!, width: 1.0),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                                 icon: Image.asset(
//                                   "assets/wallet/clock.png",
//                                 ),
//                                 onPressed: () {
//                                   selectedTodotime(context);
//                                 }),
//                             Center(
//                               child: time == null
//                                   ? Text(TimeOfDay(
//                                           minute: timeOfDay.minute,
//                                           hour: timeOfDay.hour)
//                                       .format(context))
//                                   : Text(
//                                       '$time',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 17,
//                                       ),
//                                     ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width * 0.4,
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: Colors.amber[400]!, width: 1.0),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                                 icon: Image.asset("assets/wallet/calendar.png"),
//                                 onPressed: () {
//                                   selectedTodoDate(context);
//                                 }),
//                             Center(
//                               child: date == null
//                                   ? Text(
//                                       DateFormat('yyyy-MM-dd').format(dateTime))
//                                   : Text(
//                                       '$date',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 17,
//                                       ),
//                                     ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               BlocConsumer<ExchangeCubit, ExchangeStates>(
//                 listener: (context, ExchangeStates state) {},
//                 builder: (context, ExchangeStates state) {
//                   var x = ExchangeCubit.get(context);
//                   // ignore: unrelated_type_equality_checks
//                   return TextField(
//                     // onSubmitted: (value) => _childInfo(context),
//                     textAlign: TextAlign.right,
//                     readOnly: true,
//                     controller: exchangeIdController,
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.amberAccent,
//                     ),
//                     cursorColor: Colors.amberAccent,
//                     decoration: InputDecoration(
//                       labelStyle: new TextStyle(
//                         color: Colors.amberAccent,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: const BorderSide(
//                             color: Colors.amberAccent, width: 1.0),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.amberAccent),
//                       ),
//                       prefixIcon: new DropdownButton<String>(
//                         underline: Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                   bottom:
//                                       BorderSide(color: Colors.transparent))),
//                         ),
//                         icon: new Icon(Icons.keyboard_arrow_down),
//                         items: x.exchanges!.map((ExchangeCategory value) {
//                           return new DropdownMenuItem<String>(
//                             value: value.name,
//                             child: Text(value.name),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           exchangeIdController.text = value!;
//                         },
//                       ),
//                       hintText: 'Exchange Category',
//                       hintStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold),
//                       hoverColor: Colors.amberAccent,
//                       focusColor: Colors.amberAccent,
//                     ),
// //                        onSubmitted: (value) =>  Navigator.push(
// //                            context,
// //                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               BlocConsumer<ContactCubit, ContactStates>(
//                 listener: (context, ContactStates state) {},
//                 builder: (context, ContactStates state) {
//                   var x = ContactCubit.get(context);
//                   // ignore: unrelated_type_equality_checks
//                   return TextField(
//                     // onSubmitted: (value) => _childInfo(context),
//                     textAlign: TextAlign.right,
//                     readOnly: true,
//                     controller: contactIdController,
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.amberAccent,
//                     ),
//                     cursorColor: Colors.amberAccent,
//                     decoration: InputDecoration(
//                       labelStyle: new TextStyle(
//                         color: Colors.amberAccent,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: const BorderSide(
//                             color: Colors.amberAccent, width: 1.0),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.amberAccent),
//                       ),
//                       prefixIcon: new DropdownButton<String>(
//                         underline: Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                   bottom:
//                                       BorderSide(color: Colors.transparent))),
//                         ),
//                         icon: new Icon(Icons.keyboard_arrow_down),
//                         items: x.contacts!.map((Contact value) {
//                           return new DropdownMenuItem<String>(
//                             value: value.name,
//                             child: Text(value.name),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           contactIdController.text = value!;
//                         },
//                       ),
//                       hintText: 'Contact',
//                       hintStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold),
//                       hoverColor: Colors.amberAccent,
//                       focusColor: Colors.amberAccent,
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               BlocConsumer<WalletCubit, WalletStates>(
//                 listener: (context, WalletStates state) {},
//                 builder: (context, WalletStates state) {
//                   var x = WalletCubit.get(context);
//                   // ignore: unrelated_type_equality_checks
//                   return TextField(
//                     // onSubmitted: (value) => _childInfo(context),
//                     textAlign: TextAlign.right,
//                     readOnly: true,
//                     controller: walletIdController,
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.amberAccent,
//                     ),
//                     cursorColor: Colors.amberAccent,
//                     decoration: InputDecoration(
//                       labelStyle: new TextStyle(
//                         color: Colors.amberAccent,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: const BorderSide(
//                             color: Colors.amberAccent, width: 1.0),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.amberAccent),
//                       ),
//                       prefixIcon: new DropdownButton<String>(
//                         underline: Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                   bottom:
//                                       BorderSide(color: Colors.transparent))),
//                         ),
//                         icon: new Icon(Icons.keyboard_arrow_down),
//                         items: x.wallets!.map((Wallet value) {
//                           return new DropdownMenuItem<String>(
//                             value: value.name,
//                             child: Text(value.name),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           walletIdController.text = value!;
//                         },
//                       ),
//                       hintText: 'Wallet',
//                       hintStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold),
//                       hoverColor: Colors.amberAccent,
//                       focusColor: Colors.amberAccent,
//                     ),
// //                        onSubmitted: (value) =>  Navigator.push(
// //                            context,
// //                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               BlocConsumer<WalletCubit, WalletStates>(
//                 listener: (context, WalletStates state) {
//                   if (state is UpdateWalletsToDatabaseState) {
//                     Navigator.of(context).pop();
//                   }
//                 },
//                 builder: (context, WalletStates state) {
//                   return TextButton(
//                       child: Text('save'),
//                       onPressed: () {
//                         int cId = ContactCubit.get(context).getContactId(
//                             contactName: contactIdController.text);
//                         int eId = ExchangeCubit.get(context).getExchangeId(
//                             exchangeName: exchangeIdController.text);
//                         int wId = WalletCubit.get(context)
//                             .getWalletId(walletName: walletIdController.text);
//                         String walIcon = WalletCubit.get(context)
//                             .getWalletIcon(walletName: walletIdController.text);
//                         if (eId != null && wId != null && cId != null) {
//                           TransactionCubit.get(context).insertToDatabase(
//                             contactId: cId,
//                             description: descriptionController.text,
//                             exchangeId: eId,
//                             paid: paidController.text,
//                             rest:
//                                 '${int.parse(totalController.text) - int.parse(paidController.text)}',
//                             total: totalController.text,
//                             isIncome: 0,
//                             transactionDate:
//                                 '${date != null ? date : DateFormat('yyyy-MM-dd').format(dateTime)} ${time != null ? time : TimeOfDay(minute: timeOfDay.minute, hour: timeOfDay.hour).format(context)}',
//                             walletId: wId,
//                           );
//                           String walletBalance = WalletCubit.get(context)
//                               .getWalletBalance(
//                                   walletName: walletIdController.text);
//                           int currencyId = WalletCubit.get(context)
//                               .getWalletCurrency(
//                                   walletName: walletIdController.text);
//                           int newBalance = int.parse(walletBalance) +
//                               int.parse(totalController.text);
//                           if (walletBalance != null && currencyId != null) {
//                             WalletCubit.get(context).updateWalletDatabase(
//                                 icon: walIcon,
//                                 isId: wId,
//                                 walletName: walletIdController.text,
//                                 walletBalance: '$newBalance',
//                                 currencyId: currencyId);
//                           }
//                         }
//                       });
//                 },
//               )
//             ]),
//           );
//         },
//       ),
//     );
//   }
// }
