import 'package:android_intent/android_intent.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> navigateTo({@required BuildContext context,Widget redirect}) async {
  try{
    Navigator.push(context,CupertinoPageRoute(builder: (context) => redirect)).then((val)=> {
      print("Success!")
    }).catchError((err)=> throw FlutterError('Cannot push page... $err'));
  }catch(err){
    print(err);
  }
}

Future<void> popPage({@required BuildContext context}) async {
  try{
    if(Navigator.of(context).canPop()){
      Navigator.pop(context);
    }else {
      throw FlutterError('Cannot pop Page...');
    }
  }catch(err){
    print(err);
  }
}

Future<void> showAlert({@required BuildContext context,@required Widget content,String title = "Alert",@required Function action}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: content
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: action
          ),
          TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              }
          ),
        ]
      );
    }
  );
}

Future<void> methodChannelHandler({@required String methodName,Map<String,String> arguments}) async {
  try {
    await platform.invokeMethod(methodName, arguments);
  } on PlatformException catch (e) {
    print("Failed to Invoke: '${e.message}'.");
  }
}

Future<void> openSettings() async {
  try{
    AndroidIntent settingsIntent = AndroidIntent(
        action: "android.settings.APPLICATION_DETAILS_SETTINGS",
        data: 'package:com.example.bee_pro'
    );
    settingsIntent.launch().then((value) => print("OK")).catchError((err)=>
    throw FlutterError('cannot launch app details $err')
    );
  }catch(err){
    print(err);
  }
}
Future<void> DialogModal({@required BuildContext context,@required List<Widget> content, String title = "ModalBox"}) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.only(top: 10,bottom: 10),
            title: Text(title,textAlign: TextAlign.center),
            children: content
        );
      }
  );
}