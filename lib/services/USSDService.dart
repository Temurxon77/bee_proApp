import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:bee_pro/utils/helperFunctions.dart';

class USSDService {
  static final USSDService _singleton = USSDService._internal();

  factory USSDService() {
    return _singleton;
  }

  USSDService._internal();

  final Widget dialogWidget = ListBody(
      children: <Widget>[
        Text('You declined call function'),
        Text('You can turn it on on Settings,would you want to open?')
      ]
  );

  Future<void> ussdCall(String ussdCode,BuildContext context) async {
    try {
      PermissionStatus permission = await Permission.phone.request();
      if (permission.isGranted) {
        await methodChannelHandler(methodName: 'ussd_request',arguments: {"ussd_text": ussdCode});
      } else if (permission.isDenied) {
        print('permission denied!'); //TODO: add alert dialog!
      } else if (permission.isPermanentlyDenied) {
        await showAlert(context: context, content: dialogWidget, action: openSettings,title: "USSD call Permission");
      }
    }catch(err){
      print(err);
    }
  }
}
