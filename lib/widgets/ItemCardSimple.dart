import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/widgets/DetailsButton.dart';
import 'package:flutter/material.dart';

class ItemCardSimple extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final String activationCode;
  const ItemCardSimple({Key key,this.index = 0,this.title, this.description, this.activationCode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 120.0,
        child: Stack(children: [
          Positioned(
              child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: SizedBox(
                      width: double.infinity,
                      height: 90.0,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Align(child: Text(title,overflow: TextOverflow.visible),alignment: Alignment.centerLeft)
                      )
                  )
              )
          ),
          Positioned(
                  top: 70.0,
                  right: 30.0,
                  child: DetailsButton(
                      description: description,
                      activationCode: activationCode,
                      text: AppLocalization.of(context).translate("Details"),
                      title: title))

        ]));
  }
}
