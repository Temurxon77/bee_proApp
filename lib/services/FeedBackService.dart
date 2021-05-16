import 'dart:io' show SocketException;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

class FeedBackService {
  static final FeedBackService _singleton = FeedBackService._internal();

  factory FeedBackService() {
    return _singleton;
  }
  FeedBackService._internal();

  final String _TOKEN = "1708012222:AAH_LbxE-0jcvYQ0-wQJyiBnsS_gsdJQ0l0";
  Future<void> init(String message) async {
    var telegram = Telegram(_TOKEN);
    var teleDart = TeleDart(telegram, Event());
    print("Establishing connection...");
    try {
      await teleDart.start().then((me) => print('initialized Successfully...'));
      await teleDart.telegram.sendMessage(841405834, message).then((value) =>  teleDart.stop());

    } on SocketException {
      teleDart.stop();
      print("Socket exception...");
    } on Exception {
      teleDart.stop();
      print("Something went wrong....");
    }
  }
}
