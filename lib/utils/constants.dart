import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const platform = const MethodChannel('uz.colibrisoft.beepro/ussd_call');

// Constant Colors
final Color customBlack = Colors.black87;
final Color beelineColor = Color(0xFFFFE047);
final Color ucellColor = Color(0xFF642887);

final ScrollPhysics bouncePhysics = BouncingScrollPhysics();

const List<BottomNavigationBarItem> bottomBar = [
  BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined),label: "Balance"),
  BottomNavigationBarItem(icon: Icon(Icons.wifi_outlined),label: "Internet Traffic"),
  BottomNavigationBarItem(icon: Icon(Icons.support_agent_rounded),label: "Operator")
];
const List<String> actionsList = [
  "Internet",
  "Tariffs",
  "Minutes",
  "Services",
  "SMS",
  "USSD",
  "Contacts"
];

const List<IconData> menuIcons = [
  Icons.comment_outlined,
  Icons.contact_mail,
  Icons.share,
  Icons.star_rate_outlined,
  Icons.info_outlined,
  Icons.account_balance_wallet
];

const List<IconData> actionsIconsList = [
    Icons.language,
    Icons.app_settings_alt,
    Icons.more_time,
    Icons.info_outline,
    Icons.sms_outlined,
    Icons.tag,
    Icons.headset_mic_outlined
];

