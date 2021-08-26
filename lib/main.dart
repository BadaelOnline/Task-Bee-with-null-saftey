import 'package:financial/screens/routes/app_router.dart';
import 'package:financial/screens/shared/myhomepage.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/datepicker/cubit.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/constant/bloc-observer.dart';
import 'common/database/database.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('database_wallet.db').build();
  final dao = database.walletDao;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
BlocProvider(
          create: (context) => ContactCubit()..createDatabase()),
        BlocProvider(
            create: (context) => WalletCubit()..createDatabase()),
        BlocProvider(
            create: (context) => CurrencyCubit()..createDatabase()),
        BlocProvider(
            create: (context) => ExchangeCubit()..createDatabase()),
        BlocProvider(
            create: (context) => TransactionCubit()..createDatabase()),
        BlocProvider(
            create: (context) => DatePickerCubit()..createCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
