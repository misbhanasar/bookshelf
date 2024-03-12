

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:library_project/screens/splash2.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  get splash=>null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatortospalsh(context);
  }

  
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: 
    Column(
      children: [
        Center(
      child: LottieBuilder.asset('assets/lottie/Animation - 1709318165089.json'),
    )],),
     nextScreen: splash2(),
     splashIconSize: 400,
     backgroundColor: Colors.blue,
     
     );
  
  }
}
navigatortospalsh(BuildContext context)async{
  await Future.delayed(Duration(milliseconds:  60000),(){});
Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>splash2()));
}