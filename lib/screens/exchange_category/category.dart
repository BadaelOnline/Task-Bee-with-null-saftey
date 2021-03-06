import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/exchang_category/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_exchange.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/masaref.png'),
            ),
            "${getLang(context, "Upload Image")}"),
        body: BlocConsumer<ExchangeCubit, ExchangeStates>(
          listener: (context, ExchangeStates state) {
            if (state is InsertExchangesToDatabaseState) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: InkWell(
                onTap: () {},
                child: GridView.extent(
                  mainAxisSpacing: 7.0,
                  maxCrossAxisExtent: 75.0,
                  crossAxisSpacing: 7.0,
                  children: _buildGridImages(65, context),
                ),
              ),
            );
          },
        ));
  }
}

List<Widget> _buildGridImages(numberOfImage, context) {
  List<Container> containers =
      List<Container>.generate(numberOfImage, (int index) {
    final imageName = index < 9
        ? 'assets/category/image0${index + 1}.png'
        : 'assets/category/image${index + 1}.png';
    return Container(
      child: BlocConsumer<ExchangeCubit, ExchangeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
            child: Image.asset(imageName),
            onTap: () {
              print('image name is $imageName');
              ExchangeCubit.get(context).choseImage(image: imageName);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  });
  return containers;
}
