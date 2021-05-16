import 'package:flutter/material.dart';

import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/pages/SMS/SMS_Packages.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';


class SMSPage extends StatelessWidget {
  final String title;

  const SMSPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
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
                    isScrollable: true,
                    labelColor: customBlack,
                    indicatorColor: beelineColor,
                    tabs: [
                      Tab(text: AppLocalization.of(context).translate("MSMSPckg")),
                      Tab(text: AppLocalization.of(context).translate("DSMSPckg")),
                      Tab(text: AppLocalization.of(context).translate("InterSMSPckg")),
                    ]
                )
            ),
            body: TabBarView(
                children: [
                  SMSPackages(type: 2),
                  SMSPackages(type: 1),
                  SMSPackages(type: 3)
                ]
            )
        )
    );
  }
}