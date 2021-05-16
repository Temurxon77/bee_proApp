import 'package:flutter/material.dart';

import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/ItemCardSimple.dart';


class InfoPage extends StatelessWidget {
  final String title;

  const InfoPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )),
        body: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                      addRepaintBoundaries: false,
                      addSemanticIndexes:  false,
                      addAutomaticKeepAlives: false,
                      shrinkWrap: false,
                        children: [
                          ItemCardSimple(
                            title: AppLocalization.of(context).translate("InetWeb"),
                            activationCode: "",
                            description: "http://beeline.uz"
                        ),
                          ItemCardSimple(
                              title: AppLocalization.of(context).translate("CallCenter1"),
                              activationCode: "+998901850055",
                              description: AppLocalization.of(context).translate("CallCenter1Desc")
                          ),
                          ItemCardSimple(
                              title: AppLocalization.of(context).translate("CallCenter2"),
                              activationCode: "0611",
                              description: AppLocalization.of(context).translate("CallCenter2Desc")
                          )
                      ]
                  )
    );
  }
}