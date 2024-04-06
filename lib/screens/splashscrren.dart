

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:library_project/screens/splash2.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
     nextScreen: const Splash2(),
     splashIconSize: 400,
     backgroundColor: Colors.blue,
     
     );
  
  }
}
navigatortospalsh(BuildContext context)async{
  await Future.delayed(const Duration(milliseconds:  60000),(){});
// ignore: use_build_context_synchronously
Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>const Splash2()));
}