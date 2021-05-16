import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/services/USSDService.dart';
import 'package:flutter/material.dart';

class USSDCallButton extends StatelessWidget {
  final String ussdCode;

  const USSDCallButton({Key key, this.ussdCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width*0.6,
          height: 40.0,
          color: Colors.yellow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text(AppLocalization.of(context).translate("Connect")),onPressed: () async {
            USSDService ussdService = USSDService();
            await ussdService.ussdCall(ussdCode, context);
        })
    );
  }
}
