import 'package:bee_pro/services/LanguageService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bee_pro/services/USSDService.dart';
import 'package:bee_pro/widgets/MenuDrawer.dart';
import 'db/mainDB.dart';
import 'locales/AppLocalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDB();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  const MyApp({Key key, this.appLanguage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
        create: (_) => appLanguage,
    child: Consumer<AppLanguage>(builder: (context, model, child) => MaterialApp(
      title: 'Bee Pro',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      locale: appLanguage.appLocal,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('uz','UZ'),
        Locale('ru', 'RU'),
        Locale('en', 'US')
      ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
      //        return supportedLocale;
      //      }
      //    }
      //    return supportedLocales.first;
      //   },
      home: MyHomePage()
    )
    )
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  int index = 0;

  Future<void> bottomBarCall(int index,BuildContext context) async {
    try{
      USSDService ussdService = USSDService();
      switch(index){
        case 0:
          ussdService.ussdCall("*102", context);
          break;
        case 1:
          ussdService.ussdCall("*103", context);
          break;
        case 2:
          launch("tel://0611");
          break;
      }
    }catch(err){
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ExampleStaggeredAnimations(),
      bottomNavigationBar: StatefulBuilder(
        builder: (context,state) => BottomNavigationBar(
          selectedItemColor: Colors.black87,
        currentIndex: index,
        onTap: (int i) async {
          index = i;
          state(() {});
          await bottomBarCall(i, context);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined),label: AppLocalization.of(context).translate("Balance")),
          BottomNavigationBarItem(icon: Icon(Icons.wifi_outlined),label: AppLocalization.of(context).translate("InetTraffic")),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent_rounded),label: AppLocalization.of(context).translate("Operator"))
        ]
      )
      )
    );
  }
}
