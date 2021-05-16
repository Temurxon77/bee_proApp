import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoItem extends StatelessWidget {
  final Color bgColor;
  final bool isHidden;

  const LogoItem({Key key, this.bgColor,this.isHidden}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        width: 70.0,
      decoration: BoxDecoration(
        color: this.bgColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey,width: 0.4)
      ),
      child: Center(child: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          radius: 25.0,
          child: isHidden ? Icon(CupertinoIcons.question_circle,color: this.bgColor) : Image.asset("assets/images/beelogo.png",fit: BoxFit.cover)
      ))
    );
  }
}