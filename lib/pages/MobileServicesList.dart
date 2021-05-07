import 'package:flutter/material.dart';

class MobileServicesList extends StatelessWidget {
  final Widget child;
  final int itemCount;
  final Axis axis;
  const MobileServicesList({Key key, this.child,this.itemCount = 0,this.axis = Axis.vertical}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        addSemanticIndexes: false,
        scrollDirection: axis,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          itemBuilder: (context,i) => child,
        itemCount: itemCount,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true
      )
    );
  }
}