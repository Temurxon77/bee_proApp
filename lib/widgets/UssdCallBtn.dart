import 'package:bee_pro/services/USSDService.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class USSDCallButton extends StatelessWidget {
  final String ussdCode;

  const USSDCallButton({Key key, this.ussdCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
          color: Colors.yellow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text("USSD Call"),onPressed: () async {
            USSDService ussdService = USSDService();
            await ussdService.ussdCall(ussdCode, context);
        })
    );
  }
}
