import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/text_wallet_currency.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../wallet_home.dart';

class Add_Cash_Wallet extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  String image = 'assets/wallet/dollar.png';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletStates>(
      listener: (context, state) {
        if (state is InsertWalletsToDatabaseState) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/wallet.png'),
                ),
                'Add Wallet'),
            body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  Image_Wallet(
                    image: image,
                    scale: 9.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Name_Wallet(
                    name: 'Cash',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custom_Text(
                    label: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text_Wallet_Name(
                    label: 'Balance',
                    controller: balanceController,
                    type: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text_Wallet_Balance(
                  //     label: 'balance ',
                  //     controller: balanceController,
                  //     namecurrency: kDefaultCurrency.code != null
                  //         ? kDefaultCurrency.code
                  //         : 'S.P',
                  //     type: TextInputType.number),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  checkbox_wallet(),
                  SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<CurrencyCubit, CurrencyStates>(
                    listener: (context, state) {
                      if (state is InsertCurrenciesToDatabaseState) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomRaisdButton(
                              text: 'save',
                              onPressed: () {
                                WalletCubit.get(context).insertToDatabase(
                                    icon: image,
                                    walletName: nameController.text,
                                    walletBalance: balanceController.text,
                                    currencyId: CurrencyCubit.get(context)
                                        .chosenCurrency!
                                        .id
                                    // currencyId: CurrencyCubit.get(context)
                                    //     .getCurrencyId(
                                    //         currencyName:
                                    //             currencyController.text)
                                    );
                              }),
                        ],
                      );
                    },
                  ),
                ])));
      },
    );
  }
}

// BlocConsumer<CurrencyCubit, CurrencyStates>(
//   listener: (context, CurrencyStates state) {},
//   builder: (context, CurrencyStates state) {
//     var x = CurrencyCubit.get(context);
//     // ignore: unrelated_type_equality_checks
//     return Expanded(
//       flex: 1,
//       child: TextField(
//         // onSubmitted: (value) => _childInfo(context),
//         textAlign: TextAlign.right,
//         readOnly: true,
//         controller: currencyController,
//         style: TextStyle(
//           fontSize: 18.0,
//           color: Colors.amberAccent,
//         ),
//         cursorColor: Colors.amberAccent,
//         decoration: InputDecoration(
//           labelStyle: new TextStyle(
//             color: Colors.amberAccent,
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: const BorderSide(
//                 color: Colors.amberAccent, width: 1.0),
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide:
//                 BorderSide(color: Colors.amberAccent),
//           ),
//           prefixIcon: new DropdownButton<String>(
//             underline: Container(
//               decoration: const BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                           color: Colors.transparent))),
//             ),
//             icon: new Icon(Icons.keyboard_arrow_down),
//             items: x.currencies!.map((Currency value) {
//               return new DropdownMenuItem<String>(
//                 value: value.name,
//                 child: Text(value.name),
//               );
//             }).toList(),
//             onChanged: (String? value) {
//               currencyController.text = value!;
//             },
//           ),
//           hintText: 'Currency',
//           hintStyle: TextStyle(
//               color: Colors.black,
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold),
//           hoverColor: Colors.amberAccent,
//           focusColor: Colors.amberAccent,
//         ),
//         //                        onSubmitted: (value) =>  Navigator.push(
//         //                            context,
//         //                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
//       ),
//     );
//   },
// ),
