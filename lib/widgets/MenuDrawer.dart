import 'package:bee_pro/pages/MobileActionsGrid.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/HomeLogo.dart';
import 'package:bee_pro/widgets/ImageButton.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ExampleStaggeredAnimations extends StatefulWidget {
  const ExampleStaggeredAnimations({
    Key key,
  }) : super(key: key);

  @override
  _ExampleStaggeredAnimationsState createState() =>
      _ExampleStaggeredAnimationsState();
}

class _ExampleStaggeredAnimationsState extends State<ExampleStaggeredAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async =>
            _isDrawerOpen() || _isDrawerOpening() ? false : true,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _buildAppBar(),
            body: Stack(children: [_buildContent(), _buildDrawer()])));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
        centerTitle: true,
        title: const Text(
          'Beeline',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh, color: customBlack), onPressed: () {})
        ],
        automaticallyImplyLeading: false,
        leading: AnimatedBuilder(
            animation: _drawerSlideController,
            builder: (context, child) {
              return IconButton(
                  onPressed: _toggleDrawer,
                  icon: _isDrawerOpen() || _isDrawerOpening()
                      ? const Icon(Icons.clear, color: Colors.black)
                      : const Icon(Icons.menu, color: Colors.black));
            }));
  }

  Widget _buildContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //Expanded(child: Center(child: HomeLogo())),
      Expanded(child: HomeLogo()),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text("Mobile Actions",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
      Expanded(child: MobileActionsGrid())
    ]);
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (context, child) {
          return FractionalTranslation(
              translation: Offset(_drawerSlideController.value - 1.0, 0.0),
              child: _isDrawerClosed() ? const SizedBox() : Menu());
        });
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Languages',
    'Contact Us',
    'Share',
    'Rate',
    'About this App',
    'Top up Balance'
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  AnimationController _staggeredController;
  List<Interval> _itemSlideIntervals = [];
  Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
        buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
        buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds);
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(fit: StackFit.expand, children: [
          //_buildFlutterLogo(),
          _buildContent()
        ]));
  }

  final List<Widget> _languageContent = [
    RadioListTile(
        title: const Text("O\'zbek"), value: false, onChanged: (val) {}),
    RadioListTile(
        title: const Text("Русский"), value: false, onChanged: (val) {}),
    RadioListTile(
        title: const Text("English"), value: true, onChanged: (val) {})
  ];
  final List<Widget> _topUpBalance = [
    ImageButton(action: null, assetPath: null),
    ImageButton(action: null, assetPath: null),
    ImageButton(action: null, assetPath: null),
    ImageButton(action: null, assetPath: null)
  ];
  Future<void> menuHandler(int index, BuildContext context) async {
    try {
      switch (index) {
        case 0:
          await DialogModal(
              context: context,
              content: _languageContent,
              title: 'Choose Language');
          break;
        case 1:
          break;
        case 2:
          Share.share(
              "Rate our app and feel free to comment: https://play.google.com/store/apps/details?id=com.temurkhanindustries.radio_app");
          break;
        case 3:
          if (await canLaunch("https://play.google.com")) {
            launch(
                "https://play.google.com/store/apps/details?id=com.temurkhanindustries.radio_app");
          }
          break;
        case 4:
          break;
        case 5:
          await DialogModal(context: context, content: _topUpBalance);
          break;
      }
    } catch (err) {
      print(err);
    }
  }
  // Widget _buildFlutterLogo() {
  //   return const Positioned(
  //     right: -100,
  //     bottom: -30,
  //     child: Opacity(
  //       opacity: 0.2,
  //       child: FlutterLogo(
  //         size: 400,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 16),
      ..._buildListItems(),
      const Spacer()
    ]);
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
                opacity: opacity,
                child: Transform.translate(
                    offset: Offset(slideDistance, 0), child: child));
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: ListTile(
                  onTap: () async {
                    menuHandler(i, context);
                  },
                  leading: Icon(menuIcons[i]),
                  contentPadding: const EdgeInsets.only(left: 10.0),
                  title: Text(_menuTitles[i],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ))))));
    }
    return listItems;
  }
}
