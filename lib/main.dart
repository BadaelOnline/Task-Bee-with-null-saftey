import 'package:financial/screens/routes/app_router.dart';
import 'package:financial/services/bloc/bmi/cubit.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/datepicker/cubit.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/applocal.dart';
import 'common/constant/bloc-observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences mySharedPreferences = mySharedPreferences;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  mySharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactCubit()..createDatabase()),
        BlocProvider(create: (context) => WalletCubit()..createDatabase()),
        BlocProvider(create: (context) => CurrencyCubit()..createDatabase()),
        BlocProvider(create: (context) => ExchangeCubit()..createDatabase()),
        BlocProvider(create: (context) => TransactionCubit()..createDatabase()),
        BlocProvider(create: (context) => DatePickerCubit()..createCubit()),
        BlocProvider(create: (context) => BmiCubit()..createDataabase()),
      ],
      child: MaterialApp(
        locale: _locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale("en", ""),
          Locale("ar", ""),
        ],
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                mySharedPreferences.setString("lang", currentLang.languageCode);
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
      ),
    );
  }
}
