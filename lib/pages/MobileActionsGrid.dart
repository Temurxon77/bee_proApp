import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bee_pro/pages/InfoPage.dart';
import 'package:bee_pro/pages/InternetPage.dart';
import 'package:bee_pro/pages/Minutes.dart';
import 'package:bee_pro/pages/SMS.dart';
import 'package:bee_pro/pages/ServicesPage.dart';
import 'package:bee_pro/pages/TariffsPage.dart';
import 'package:bee_pro/pages/USSDPage.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/ActionCard.dart';


class MobileActionsGrid extends StatelessWidget {
  final List<String> actionsList;

  const MobileActionsGrid({Key key, this.actionsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: bouncePhysics,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        addRepaintBoundaries: false,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        children: [
          ActionCard(
              title: actionsList[0],
              icon: actionsIconsList[0],
              child: InternetPage(title: actionsList[0])),
          ActionCard(
              title: actionsList[1],
              icon: actionsIconsList[1],
              child: TariffsPage(title: actionsList[1])),
          ActionCard(
              title: actionsList[2],
              icon: actionsIconsList[2],
              child: MinutesPage(title: actionsList[2])),
          ActionCard(
              title: actionsList[3],
              icon: actionsIconsList[3],
              child: ServicesPage(title: actionsList[3])),
          ActionCard(
              title: actionsList[4],
              icon: actionsIconsList[4],
              child: SMSPage(title: actionsList[4])),
          ActionCard(
              title: actionsList[5],
              icon: actionsIconsList[5],
              child: USSDPage(title: actionsList[5])),
          ActionCard(
              title: actionsList[6],
              icon: actionsIconsList[6],
              child: InfoPage(title: actionsList[6])),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 6.0,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  enableFeedback: false,
                  onTap: () async {
                    if(await canLaunch("https://beeline.uz")){
                      await launch("https://nomer.beeline.uz");
                    }
                  },
                  canRequestFocus: false,
                  splashColor: Colors.yellow[400],
                  hoverColor: Colors.yellow[400],
                  child: Center(
                      child: ListTile(
                          title: Text(actionsList[7]),
                          trailing: Icon(actionsIconsList[7],
                              size:
                                  45))) //mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [ Text("Internet"),Icon(Icons.open_in_browser,size: 45) ])
                  ))
        ]);
  }
}
