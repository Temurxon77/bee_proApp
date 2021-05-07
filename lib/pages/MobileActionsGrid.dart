import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/ActionCard.dart';
import 'package:flutter/material.dart';

class MobileActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return GridView.count(
      physics: bouncePhysics,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      addRepaintBoundaries: false,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        children: [
          for(int i = 0;i<actionsList.length;i++)
            ActionCard(title: actionsList[i],icon: actionsIconsList[i])
        ]
    );
  }
}