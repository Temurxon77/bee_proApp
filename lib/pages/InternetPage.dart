import 'package:flutter/material.dart';
import 'package:bee_pro/bloc/InternetBloc.dart';
import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/models/models.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/ItemCardSimple.dart';


// ignore: must_be_immutable
class InternetPage extends StatelessWidget {
  final String title;
  InternetBloc internetBloc;

  InternetPage({Key key, this.title}) : super(key: key){
    internetBloc = InternetBloc([]);
    internetBloc.getInfo();
  }

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
            )
        ),
      body: StreamBuilder<List<Internet>>(
          stream: internetBloc.serviceUpd,
          builder: (context,snap) {
            print(snap.data);
            if(snap.hasData) {
              if(snap.connectionState == ConnectionState.done){
                return Center(child: CircularProgressIndicator(backgroundColor: beelineColor));
              }
              if(snap.connectionState == ConnectionState.active) {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                  addRepaintBoundaries: false,
                  addSemanticIndexes:  false,
                  addAutomaticKeepAlives: false,
                  shrinkWrap: false,
                  itemCount: snap.data.length,
                  itemBuilder: (context,i) {
                      if(AppLocalization.of(context).locale.languageCode == 'ru'){
                        return ItemCardSimple(
                            title: snap.data[i].titleRU,
                            description: snap.data[i].descriptionRU,activationCode: snap.data[i].activationCode);
                      }
                      return ItemCardSimple(
                        title: snap.data[i].titleUZ,
                        activationCode: snap.data[i].activationCode,
                        description: snap.data[i].descriptionUZ);
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
