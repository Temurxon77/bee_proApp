import 'package:flutter/material.dart';

import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/models/models.dart';
import 'package:bee_pro/repositories/RepoService.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/ItemCardSimple.dart';


class USSDPage extends StatelessWidget {
  final String title;

  const USSDPage({Key key, this.title}) : super(key: key);
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
        body: FutureBuilder<List<USSD>>(
            future: RepositoryServiceBeePro.getUssdData(),
            builder: (context,snap) {
              print(snap.data);
              if(snap.hasData) {
                if(snap.connectionState == ConnectionState.active){
                  return Center(child: CircularProgressIndicator(backgroundColor: beelineColor));
                }
                if(snap.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                      addRepaintBoundaries: false,
                      addSemanticIndexes:  false,
                      addAutomaticKeepAlives: false,
                      shrinkWrap: false,
                      itemCount: snap.data.length,
                      itemBuilder: (context,i) {
                        if(AppLocalization.of(context).locale.languageCode == "ru"){
                          return ItemCardSimple(
                              title: i > 0 ? snap.data[i].titleRU : snap.data[i].titleRU.substring(0,14),
                              description: "",
                              activationCode: snap.data[i].activationCode);
                        }
                        return ItemCardSimple(
                            title: i > 0 ? snap.data[i].titleUZ : snap.data[i].titleRU.substring(0,20),
                            activationCode: snap.data[i].activationCode,
                            description: "");
                      }
                  );
                }
              } else if(snap.hasError) {
                return Center(child: Text("Something went wrong..."));
              }
              return Center();
            }
        )
    );
  }
}