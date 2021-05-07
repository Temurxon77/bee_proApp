import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/LogoItem.dart';
import 'package:flutter/material.dart';

class HomeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 250.0,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            height: 200.0,
            width: 200.0,
            child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: beelineColor,
                  border: Border.all(color: Colors.grey,width: 0.4)
                ),
              child: Center(child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 50.0,
                  child: Image.asset("assets/images/beelogo.png")))
            )
          ),
          Positioned(
              top: 60.0,
              left: 40.0,
            child: LogoItem(bgColor: beelineColor)
          ),
          Positioned(
              top: 130.0,
              left: 75.0,
              child: LogoItem(bgColor: Colors.red)
          ),
          Positioned(
              top: 170.0,
              left: 145.0,
              child: LogoItem(bgColor: ucellColor)
          ),
          Positioned(
              top: 130.0,
              right: 75.0,
              child: LogoItem(bgColor: Colors.orange)
          ),
          Positioned(
              top: 60.0,
              right: 40.0,
              child: LogoItem(bgColor: Colors.blue)
          ),
        ]
        )
    );


  }
}