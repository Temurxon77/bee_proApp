import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// platform channel
const platform = const MethodChannel('uz.colibrisoft.beepro/ussd_call');

// Constant Colors
const Color customBlack = Colors.black87;
const Color beelineColor = Color(0xFFFFE047);
const Color ucellColor = Color(0xFF642887);
const Color borderGray = Color(0xFFEEEEEE);

//Widget attributes
const ScrollPhysics bouncePhysics = BouncingScrollPhysics();
const ScrollPhysics clampingPhysics = ClampingScrollPhysics();

// Bottom Navbar
const List<BottomNavigationBarItem> bottomBar = [

];
//home page constants
const String beeLineLogo = "assets/images/beelogo.png";
//menu item constants
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
    Icons.headset_mic_outlined,
    Icons.sim_card_outlined
];

