import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/exchang_category/states.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_text.dart';
import 'package:taskBee/widget/exchange_revenue_categoray/alert_dialog_categoray.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddExchange extends StatelessWidget {
  // final String? catImage;
  TextEditingController? nameController = TextEditingController();

  AddExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Image.asset('assets/homepage/masaref.png'),
          "${getLang(context, "Add Exchang Categoray")}"),
      body: BlocConsumer<ExchangeCubit, ExchangeStates>(
        listener: (context, ExchangeStates state) {
          if (state is InsertExchangesToDatabaseState) {
            ExchangeCubit.get(context).chosenImage = '';
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<ExchangeCubit, ExchangeStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/category');
                          },
                          child: ExchangeCubit.get(context).chosenImage == ''
                              ? Container(
                                  height: 120,
                                  width: 120,
                                  child: Center(
                                      child: Text(
                                          "${getLang(context, "Upload Image")}")),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    border: Border.all(
                                      color: Colors.amber[400]!,
                                      width: 2,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    image: DecorationImage(
                                      scale: 0.5,
                                      image: AssetImage(
                                          ExchangeCubit.get(context)
                                              .chosenImage!),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    border: Border.all(
                                      color: Colors.amber[400]!,
                                      width: 2,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Custom_Text(
                  label: "${getLang(context, "Name")}",
                  controller: nameController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7.5,
                ),
                RaisedButtonWallets(
                    onPressed: () {
                      nameController!.text.isNotEmpty &&
                              ExchangeCubit.get(context).chosenImage! != ''
                          ? ExchangeCubit.get(context).insertToDatabase(
                              isIncome: 0,
                              exchangeName: nameController!.text,
                              catImage: ExchangeCubit.get(context).chosenImage)
                          : showDialog(
                              context: context,
                              builder: (_) => AlertDialogCategoray(
                                icon: Icon(
                                  Icons.report_problem_rounded,
                                  color: Colors.amberAccent,
                                  size: 45,
                                ),
                                content:
                                    "${getLang(context, "Attention Add Categoray")}",
                                cancelMethod: () {
                                  Navigator.of(context).pop();
                                },
                                submitMethod: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                    },
                    text: "${getLang(context, "Create")}"),
              ]),
            ),
          );
        },
      ),
    );
  }
}
