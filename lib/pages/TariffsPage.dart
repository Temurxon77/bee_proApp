import 'package:flutter/material.dart';

import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/pages/Tariffs/ActiveTariffs.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';


class TariffsPage extends StatelessWidget {
  final String title;

  TariffsPage({Key key, this.title}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 5.0,
            leadingWidth: 40,
            centerTitle: true,
            title: Text(title, style: TextStyle(color: Colors.black87)),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: customBlack,
                onPressed: () async => popPage(context: context)
            ),
          bottom: TabBar(
            //controller: tabController,
            labelColor: customBlack,
              isScrollable: true,
            indicatorColor: beelineColor,
            tabs: [
              Tab(text: AppLocalization.of(context).translate("Active")),
              Tab(text: AppLocalization.of(context).translate("InActive"))
            ]
          )
        ),
        body: TabBarView(
          children: [
            ActiveTariffs(isArchieved: 0),
            ActiveTariffs(isArchieved: 1)
          ]
        )
        )
    );
  }
}
