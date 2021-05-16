import 'package:bee_pro/services/LanguageService.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageHandler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<Locale>(
                    title: const Text("O\'zbek"),
                    value: const Locale("uz"),
                    onChanged: (val) {
                      appLanguage.changeLanguage(val);
                    },
                    groupValue: appLanguage.appLocal),
                RadioListTile<Locale>(
                    title: const Text("Русский"),
                    value: const Locale("ru"),
                    onChanged: (val) {
                      appLanguage.changeLanguage(Locale("ru"));
                    },
                    groupValue: appLanguage.appLocal)
              ]);
  }
}