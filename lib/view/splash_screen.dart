import 'dart:async';
import 'dart:math' as math;

import 'package:covid/view/state_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3)
  )..repeat();

  @override
  @override

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
     Timer (Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StateScreen()))

     );



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       AnimatedBuilder(animation: _controller,
           child: Container(
             height: 200,
             width: 200,
             child: Center(child: Image(image: AssetImage('images/virus.png'))),),
           builder: (BuildContext context, Widget? child){
         return Transform.rotate(angle:_controller.value*2.0*math.pi ,
           child: child,

         );
           }

    ),
          SizedBox(height: MediaQuery.of(context).size.height*0.08,),
          Center(child: Text('Covid Tracker\n App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}
