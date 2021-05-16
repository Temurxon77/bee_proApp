import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/ContentDialog.dart';
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final String text;
  final String title;
  final String description;
  final String activationCode;

  const DetailsButton({Key key, this.title,this.text, this.description, this.activationCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
            color: Colors.yellow,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Text(text),onPressed: () async {
            await dialogModal(context: context, content: [
              ContentDialog(description: description,activationCode: activationCode)
            ],title: title);
        })
    );
  }
}
