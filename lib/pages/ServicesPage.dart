import 'package:flutter/material.dart';

import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/pages/Services/ServicesTypes.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';


class ServicesPage extends StatelessWidget {
  final String title;

  ServicesPage({Key key, this.title}) : super(key: key);

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
                    isScrollable: true,
                  //controller: tabController,
                    labelColor: customBlack,
                    indicatorColor: beelineColor,
                    tabs: [
                      Tab(text: AppLocalization.of(context).translate("Main")),
                      Tab(text: AppLocalization.of(context).translate("DisableSMS"))
                    ]
                )
            ),
            body: TabBarView(
                children: [
                  ServicesTypes(type: 1),
                  ServicesTypes(type: 3)
                ]
            )
        )
    );
  }
}
