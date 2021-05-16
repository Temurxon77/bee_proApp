import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/UssdCallBtn.dart';
import 'package:flutter/material.dart';

class ContentDialog extends StatelessWidget {
  final String description;
  final String activationCode;

  const ContentDialog({Key key, this.description, this.activationCode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0,right: 10.0),
            child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min, children: [
              Flexible(
                  child: SizedBox(
                      //height: MediaQuery.of(context).size.height*0.25,
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(description,textAlign: TextAlign.left)))),
              SizedBox(height: 20.0),
              Flexible(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(AppLocalization.of(context).translate("Activation")),
                    Text(activationCode)
                  ])),
              SizedBox(height: 20.0),
              Flexible(
                child: USSDCallButton(ussdCode: activationCode.replaceAll(RegExp(r'#'), ""))
              ),
              Flexible(
                child: TextButton(
                    onPressed: () async { await popPage(context: context); },
                    child: Text(AppLocalization.of(context).translate("Cancel"))),
              )
            ]));
  }
}
