import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<HeartWidget>with SingleTickerProviderStateMixin {

  bool isfav=false;
//this is animationcontroller
  late AnimationController _animationController;
  //this is used for animation
   late Animation<Color?> _coloranimation;
  late Animation<double>_sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
        duration:const  Duration(milliseconds: 300),
        vsync: this);
    _coloranimation=ColorTween(begin: Colors.white, end: const  Color(0xff76984c)).animate(_animationController);
    _sizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween(begin: 20,end: 40),
            weight: 50,
          ), TweenSequenceItem<double>(
          tween: Tween(begin: 40,end: 20),
          weight: 50,
        ),
        ]
    ).animate(_animationController);
//this is used to listen any change in animation
    _animationController.addListener(() {

    });
    //this is used in listening the controller status it is done or not
    _animationController.addStatusListener((status) {
      //here we changing the bool value depending on  status
      if(status==AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }
      if(status==AnimationStatus.dismissed){
        setState(() {
          isfav=false;

        });
      }

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context,_){
        return
          IconButton(
            padding: EdgeInsets.zero,
          icon: Icon(
            Icons.favorite,
            color:_coloranimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isfav? _animationController.reverse(): _animationController.forward();
          },
        );
      },

    );
  }
}