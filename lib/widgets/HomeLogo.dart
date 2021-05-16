import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/widgets/LogoItem.dart';
import 'package:flutter/material.dart';

class HomeLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeLogoState();
  }
}

class _HomeLogoState extends State<HomeLogo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = ColorTween(
      begin: beelineColor,
      end: Colors.red,
    ).animate(_controller)
        ..addListener(() {
          setState(() {});
        });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 250.0,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            height: 200.0,
            width: 200.0,
            child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: animation.value,
                  border: Border.all(color: Colors.grey,width: 0.4)
                ),
              child: Center(child: CircleAvatar(
                  backgroundColor: borderGray,
                  radius: 50.0,
                  child: Image.asset(beeLineLogo)))
            )
          ),
          // TODO: Add in new release!!! //
          // Positioned(
          //     top: 60.0,
          //     left: 40.0,
          //     child: InkWell(
          //       enableFeedback: false,
          //       borderRadius: BorderRadius.circular(40),
          //     onTap: ()  async { await _controller.forward(); _controller.reverse(); },
          //       child: const LogoItem(bgColor: beelineColor,isHidden: false)
          //     )
          // ),
          // const Positioned(
          //     top: 130.0,
          //     left: 75.0,
          //     child: const LogoItem(bgColor: Colors.red,isHidden: true)
          // ),
          // const Positioned(
          //     top: 170.0,
          //     left: 145.0,
          //     child: const LogoItem(bgColor: ucellColor,isHidden: true)
          // ),
          // const Positioned(
          //     top: 130.0,
          //     right: 75.0,
          //     child: const LogoItem(bgColor: Colors.orange,isHidden: true)
          // ),
          // const Positioned(
          //     top: 60.0,
          //     right: 40.0,
          //     child: const LogoItem(bgColor: Colors.blue,isHidden: true)
          // ),
          //TODO: /////////////////////////////////////
        ]
        )
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}