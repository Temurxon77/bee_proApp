import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  ActionCard({Key key, this.title,this.icon,this.child}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return  Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        enableFeedback: false,
      onTap: () async {
          await navigateTo(context: context,redirect: child);
      },
      canRequestFocus: false,
      splashColor: Colors.yellow[400],
      hoverColor: Colors.yellow[400],
      child: Center(child: ListTile(
          title: Text(title),trailing: Icon(icon,size: 45)
        )
      )//mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [ Text("Internet"),Icon(Icons.open_in_browser,size: 45) ])
    )
    );
  }
}