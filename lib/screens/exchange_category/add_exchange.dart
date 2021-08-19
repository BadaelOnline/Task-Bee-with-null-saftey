import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'exchange_home.dart';

// ignore: must_be_immutable
class AddExchange extends StatelessWidget {
  // final String? catImage;
  TextEditingController? nameController = TextEditingController();

  AddExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => ExchangeHome()));
          },
        ),
        centerTitle: true,
        title: Text('Add Exchange Category'),
        backgroundColor: Colors.amber[400],
      ),
      body: BlocConsumer<ExchangeCubit, ExchangeStates>(
        listener: (context, ExchangeStates state) {
          if (state is InsertExchangesToDatabaseState) {
            ExchangeCubit.get(context).chosenImage = '';
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {

          return Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<ExchangeCubit, ExchangeStates>(
                     listener: (context, state) {
                      // TODO: implement listener
                    },
                      builder: (context, state) {
                      return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/category');
                      },
                      child: ExchangeCubit.get(context).chosenImage == ''
                          ? Container(
                              height: 100,
                              width: 100,
                              child: Center(child: Text('Upload Image')),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                border: Border.all(
                                  color: Colors.amber[400]!,
                                  width: 2,
                                ),
                              ),
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                image: DecorationImage(
                                  scale: 0.5,
                                  image: AssetImage(ExchangeCubit.get(context).chosenImage!),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
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
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextFormField(
                            label: 'Name Category',
                            controller: nameController,
                            prefix: Icons.category)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomRaisdButton(
                        onPressed: () {
                          ExchangeCubit.get(context).insertToDatabase(
                              exchangeName: nameController!.text,
                              catImage: ExchangeCubit.get(context).chosenImage);
                        },
                        text: 'Save'),
                    CustomRaisdButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Cancel'),
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
