import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/widgets/DetailsButton.dart';
import 'package:flutter/material.dart';

class ItemCardComplex extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final String activationCode;
  final String annualPrice;
  final String internet;
  final String calls;
  const ItemCardComplex({Key key,this.index,this.title, this.description, this.activationCode, this.annualPrice, this.internet, this.calls})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 150.0,
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
                      height: 120.0,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,textAlign: TextAlign.left),
                            SizedBox(height: 10.0),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(AppLocalization.of(context).translate("AnnualPrice")),Text(annualPrice) ]),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(AppLocalization.of(context).translate("Internet")),Text(internet) ]),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(AppLocalization.of(context).translate("Call")),Text(calls) ])
                        ]
                      ))
                  )
              )
          ),
          Positioned(
              top: 100.0,
              right: 40.0,
              child: DetailsButton(
                  description: description,
                  activationCode: activationCode,
                  text: AppLocalization.of(context).translate("Details"),
                  title: title))

        ]));
  }
}
