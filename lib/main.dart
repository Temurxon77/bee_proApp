import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'package:bee_pro/services/USSDService.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/MenuDrawer.dart';
import 'db/mainDB.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bee Pro',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage()
    );
  }
}

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
        items: bottomBar
      )
      )
    );
  }
}
