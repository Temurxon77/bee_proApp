import 'package:bee_pro/models/Internet.dart';
import 'package:bee_pro/models/Tariffs.dart';
import 'package:bee_pro/repositories/RepoService.dart';
import 'package:rxdart/rxdart.dart';

class InternetBloc {
  final List<Internet> allData;
  List<Internet> get getData => allData;
  final BehaviorSubject<List<Internet>> serviceUpd;

  InternetBloc(this.allData) : this.serviceUpd =  BehaviorSubject<List<Internet>>.seeded(allData);
  Future<void> getInfo() async {
    await RepositoryServiceBeePro.getInternetData().then((value) => serviceUpd.add(value));
  }
  void dispose() {
    serviceUpd.close();
  }
}

class TariffsBloc {
  final List<Tariffs> allData;
  List<Tariffs> get getData => allData;
  final BehaviorSubject<List<Tariffs>> serviceUpd;

  TariffsBloc(this.allData) : this.serviceUpd =  BehaviorSubject<List<Tariffs>>.seeded(allData);
  Future<void> getInfoActive() async {
    await RepositoryServiceBeePro.getTariffsData(isArchieved: 0).then((value) => serviceUpd.add(value));
  }
  Future<void> getInfoArchieved() async {
    await RepositoryServiceBeePro.getTariffsData(isArchieved: 1).then((value) => serviceUpd.add(value));
  }
  void dispose() {
    serviceUpd.close();
  }
}

