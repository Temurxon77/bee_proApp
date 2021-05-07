import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/UssdCallBtn.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final bool isTariff;
  final bool canCall;

  const ItemCard({Key key, this.isTariff = false, this.canCall = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double CardHeight = isTariff ? 100 : 75.0;
    return SizedBox(
        width: double.infinity,
        height: CardHeight + 30,
        child: Stack(children: [
          Positioned(
              child: Card(
                elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                      width: double.infinity,
                      height: CardHeight,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: isTariff
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                      Text("Status Gold NEW"),
                                      Text("Subscription fee 13000 sums/month"),
                                      Text("Internet 30000 MB"),
                                      Text("Call Unlimited")
                                    ])
                              : Align(
                                  child: Text("1000 MB"),
                                  alignment: Alignment.centerLeft))))),
          canCall
              ? Positioned(
                  top: CardHeight - 20.0, right: 30, child: USSDCallButton(ussdCode: "*100"))
              : SizedBox()
        ]));
  }
}
