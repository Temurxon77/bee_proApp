import 'package:bee_pro/db/mainDB.dart';
import 'package:bee_pro/models/Internet.dart';
import 'package:bee_pro/models/Messages.dart';
import 'package:bee_pro/models/Minutes.dart';
import 'package:bee_pro/models/Services.dart';
import 'package:bee_pro/models/Tariffs.dart';
import 'package:bee_pro/models/USSD.dart';

class RepositoryServiceBeePro {
  static Future<List<Internet>> getInternetData() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.internetTable}''';
    final data = await db.rawQuery(sql);
    List<Internet> infos = List();

    for(final node in data){
      final info = Internet.fromJson(node);
      infos.add(info);
    }
    return infos;
  }

  static Future<List<Messages>> getMessagesData({int type = 1}) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.messagesTable}
    WHERE MessagesType == $type''';
    final data = await db.rawQuery(sql);
    List<Messages> infos = List();

    for(final node in data){
      final info = Messages.fromJson(node);
      infos.add(info);
    }
    return infos;
  }
  
  static Future<List<USSD>> getUssdData() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.ussdTable}''';
    final data = await db.rawQuery(sql);
    List<USSD> infos = List();

    for(final node in data){
      final info = USSD.fromJson(node);
      infos.add(info);
    }
    return infos;
  }

  static Future<List<Minutes>> getMinutesData() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.minutesTable}''';
    final data = await db.rawQuery(sql);
    List<Minutes> infos = List();

    for(final node in data){
      final info = Minutes.fromJson(node);
      infos.add(info);
    }
    return infos;
  }

  static Future<List<Tariffs>> getTariffsData({int isArchieved = 0}) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.tariffsTable}
    WHERE isArchieved == $isArchieved''';
    final data = await db.rawQuery(sql);
    List<Tariffs> infos = List();

    for(final node in data){
      final info = Tariffs.fromJson(node);
      infos.add(info);
    }
    return infos;
  }

  static Future<List<Services>> getServicesData({int type = 1}) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.servicesTable}
    WHERE ServiceType == $type''';
    final data = await db.rawQuery(sql);
    List<Services> infos = List();
    print(infos);
    for(final node in data){
      final info = Services.fromJson(node);
      infos.add(info);
    }
    return infos;
  }
}