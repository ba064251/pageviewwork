import 'dart:async';
import 'package:flutter/material.dart';
import '../pageview/intropage1.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const IntroPage1()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Container(
                      height: 300,
                      width: 300,
                      child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage('Assets/Images/hydrahublogo.png'))),
                ],
              ),
            )
        ),
      ),
    );
  }
}
