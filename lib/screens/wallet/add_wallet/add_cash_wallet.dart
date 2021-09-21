import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/text_wallet_name.dart';
import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Add_Cash_Wallet extends StatelessWidget {
  String? currencyName;
  int? currencyId;

  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  int dropdownValue = 1;
  String image = 'assets/wallet/dollar.png';

  Add_Cash_Wallet(
      {this.walletId,
      this.walletName,
      this.walletCurrencyId,
      this.walletbalance});
  final walletId;
  final String? walletName;
  final walletCurrencyId;
  final walletbalance;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    currencyId = arguments['currencyId'];
    currencyName = arguments['currencyName'];
    return Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/wallet.png'),
            ),
            'Add Wallet'),
        body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              Text_Wallet_Name(
                  label: 'Name',
                  controller: nameController,
                  namecurrency: currencyName != null ? '$currencyName' : 'S.P'),
              SizedBox(
                height: 20,
              ),
              Text_Wallet_Balance(
                  label: 'balance ',
                  controller: balanceController,
                  namecurrency: currencyName != null ? '$currencyName' : 'S.P',
                  type: TextInputType.number),
              SizedBox(
                height: 20,
              ),
              checkbox_wallet(),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<CurrencyCubit, CurrencyStates>(
                listener: (context, state) {
                  if (state is InsertCurrenciesToDatabaseState) {
                    Navigator.of(context).popAndPushNamed('/walletHome');
                  }
                },
                builder: (context, state) {
                  var x = CurrencyCubit.get(context).currencies;
                  return Column(
                    children: [
                      CustomRaisdButton(
                          text: 'save',
                          onPressed: () {
                            WalletCubit.get(context).insertToDatabase(
                                icon: image,
                                walletName: nameController.text,
                                walletBalance: balanceController.text,
                                currencyId: currencyId
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
