import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final Function(Future) action;
  final String assetPath;
  final double height;
  final double width;

  const ImageButton({Key key,this.action, this.assetPath, this.height = 50.0, this.width = double.infinity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,width: width,child: Ink.image(
        fit: BoxFit.fitHeight,
        child: InkWell(onTap: (){}),
        image: AssetImage(assetPath?? "assets/images/beeline_logo.png"))
    );
  }
}