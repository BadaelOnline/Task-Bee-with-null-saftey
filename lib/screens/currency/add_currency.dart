import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddCurrency extends StatelessWidget {


  TextEditingController nameController = TextEditingController();

  late int isID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Icon(Icons.wallet_giftcard),
          'Add Currency'),
      body:BlocConsumer<CurrencyCubit,CurrencyStates>(
        listener: (context,CurrencyStates state){
          if(state is InsertCurrenciesToDatabaseState){
            Navigator.of(context).pop();
          }
        },
        builder: (context,state){
          return ListView(
              children: [
                SizedBox(height: 20,),
                CustomTextFormField(
                  label:'Name Currency' ,
                  controller:nameController ,
                  prefix: Icons.money,
                  type:TextInputType.text ,

                ),
                SizedBox(
                  height: 50,
                ),
                FlatButton(
                    child: Text('save'),
                    onPressed: () {
                      CurrencyCubit.get(context).insertToDatabase(
                        currencyName: nameController.text,
                      );
                }),
          ]);
        },
      ),
    );
  }
}

