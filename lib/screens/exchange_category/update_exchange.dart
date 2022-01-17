import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/exchang_category/states.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_raisd_button.dart';
import 'package:taskBee/widget/custom_text.dart';
import 'package:taskBee/widget/exchange_revenue_categoray/alert_dialog_categoray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category.dart';

// ignore: must_be_immutable
class UpdateExchange extends StatelessWidget {
  int? exchangeId;
  String? exchangeName;
  String? catImage;

  TextEditingController nameController = TextEditingController();

  UpdateExchange({
    Key? key,
    this.exchangeId,
    this.exchangeName,
    this.catImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    exchangeId = arguments['categoryId'];
    exchangeName = arguments['categoryName'];
    catImage = arguments['categoryIcon'];
    return Scaffold(
      appBar: CustomAppBar(Image.asset('assets/homepage/masaref.png'),
          "${getLang(context, "Update Exchang Categoray")}"),
      body: BlocConsumer<ExchangeCubit, ExchangeStates>(
        listener: (context, state) {
          if (state is UpdateExchangesToDatabaseState) {
            ExchangeCubit.get(context).chosenImage = '';
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          ExchangeCubit cubit = ExchangeCubit.get(context);
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Category()));
                      },
                      child: ExchangeCubit.get(context).chosenImage == ''
                          ? Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                image: DecorationImage(
                                  scale: 0.5,
                                  image: AssetImage('$catImage'),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
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
                                      '${ExchangeCubit.get(context).chosenImage}'),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                border: Border.all(
                                  color: Colors.amber[400]!,
                                  width: 2,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Custom_Text(
                  label: "${getLang(context, "Name")}",
                  controller: nameController =
                      TextEditingController(text: '$exchangeName'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7.5,
                ),
                RaisedButtonWallets(
                    onPressed: () {
                      nameController.text != ""
                          ? ExchangeCubit.get(context).updateExchangeDatabase(
                              isIncome: 0,
                              isId: exchangeId,
                              exchangeName: nameController.text,
                              icon: ExchangeCubit.get(context).chosenImage == ''
                                  ? catImage
                                  : ExchangeCubit.get(context).chosenImage,
                            )
                          : showDialog(
                              context: context,
                              builder: (_) => AlertDialogCategoray(
                                color: Colors.amberAccent,
                                x: 1,
                                icon: Icon(
                                  Icons.report_problem_rounded,
                                  color: Colors.amberAccent,
                                  size: 45,
                                ),
                                content:
                                    "${getLang(context, "Attention Update Categoray")}",
                                cancelMethod: () {
                                  Navigator.of(context).pop();
                                },
                                submitMethod: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                    },
                    text: "${getLang(context, "Update")}"),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialogCategoray(
                        x: 0,
                        color: Colors.red[700],
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[700],
                        ),
                        content:
                            "${getLang(context, "dialog delete Categoray")}",
                        cancelMethod: () {
                          Navigator.of(context).pop();
                        },
                        submitMethod: () {
                          cubit.deleteExchangeFromDatabase(id: exchangeId);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "${getLang(context, "Delete Categoray")}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[700],
                    ),
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
