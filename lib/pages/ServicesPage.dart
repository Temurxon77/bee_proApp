import 'package:bee_pro/pages/MobileServicesList.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/ItemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServicesPage extends StatelessWidget {
  final int tabLength;
  final bool canCall;
  final bool isTariff;

  const ServicesPage({Key key, this.tabLength, this.canCall, this.isTariff}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh,color: Colors.black87),
              onPressed: () async {
                try {
                  await platform.invokeMethod('app_intent',{"pack_name": "com.temurkhanindustries.radio_app"});
                } on PlatformException catch (e) {
                  //response = "Failed to Invoke: '${e.message}'.";
                }
              }
            )
          ],
          title: Text("Internet",style: TextStyle(color: Colors.black87)),
          leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.black87),onPressed: ()  async { await popPage(context: context); }),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black87,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(text: "Monthly Internet Packages"),
              Tab(text: "Weekly Internet Packages"),
              Tab(text: "Daily Internet Packages"),
              Tab(text: "4G Internet Internet Packages")
            ]
          )
        ),
        body: TabBarView(
          children: [
            for(int i=0;i<tabLength;i++)
              MobileServicesList(child: ItemCard(canCall: true,isTariff: true),itemCount: 5)
          ]
    )
      )
    );
  }
}