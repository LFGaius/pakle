
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AfriSpinner extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
//
//  double width=20.0,height=20;
//
//  Spinner({this.width,this.height});
  final double width;
  final double height;

  AfriSpinner({this.width,this.height});

  @override
  _AfriSpinnerState createState() => _AfriSpinnerState();
}

class _AfriSpinnerState extends State<AfriSpinner> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> animationrotation;


  @override
  void initState(){
    super.initState();
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 10));
    animationrotation=Tween<double>(
      begin: 0.0,
      end: 2*math.pi
    ).animate(animationController);
    animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: animationController,
        child: Image.asset(
            "assets/spinner.png",
            width: widget.width ?? 100,
            height: widget.height ?? widget.width ?? 100,
        ),
        builder: (context,child)=> Transform.rotate(
          child: child,
          angle: animationrotation.value,
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   // This method is rerun every time setState is called, for instance as repeatne
  //   // by the _incrementCounter method above.
  //   //
  //   // The Flutter framework has been optimized to make rerunning build methods
  //   // fast, so that you can just rebuild anything that needs updating rather
  //   // than having to individually change instances of widgets.
  //   return Container(
  //     child: AnimatedBuilder(
  //       animation: animationController,
  //       child: Image.asset(
  //           "assets/spinner.png",
  //           width: widget.width ?? 100,
  //           height: widget.height ?? widget.width ?? 100,
  //       ),
  //       builder: (context,child)=> Transform.rotate(
  //         child: child,
  //         angle: animationrotation.value,
  //       ),
  //     ),
  //   );
  // }
}
