import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/models/models.dart';
import 'package:bee_pro/repositories/RepoService.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/ItemCardComplex.dart';
import 'package:flutter/material.dart';

class ActiveTariffs extends StatelessWidget {
  final int isArchieved;
  const ActiveTariffs({Key key, this.isArchieved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tariffs>>(
        future: RepositoryServiceBeePro.getTariffsData(isArchieved: isArchieved),
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
                      return ItemCardComplex(
                          calls: snap.data[i].calls,
                          internet: snap.data[i].internetTraffic,
                          annualPrice: snap.data[i].annualPrice,
                          title: snap.data[i].titleRU,
                          description: snap.data[i].descriptionRU,
                          activationCode: snap.data[i].activationCode);
                    }
                    return ItemCardComplex(
                        calls: snap.data[i].calls,
                        internet: snap.data[i].internetTraffic,
                        annualPrice: snap.data[i].annualPrice,
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
    );
  }
}