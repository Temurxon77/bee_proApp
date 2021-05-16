import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool isMulti;
  final TextEditingController controller;

  const TextFieldCustom({Key key,this.controller, this.label,this.keyboardType,this.isMulti = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      maxLines: isMulti ? 5: 1,
        maxLength: isMulti ? 400 : null,
        keyboardType: keyboardType,
        cursorColor: customBlack,
        cursorWidth: 0.8,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: customBlack),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: customBlack)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: customBlack)
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: customBlack)
            )
        )
    );
  }
}