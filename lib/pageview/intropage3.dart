import 'package:flutter/material.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Navigator.pop(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/Images/pg1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFFE3C1A0), // Soft brown shade
                      Colors.transparent, // Fading to transparent
                    ],
                    stops: [0.0, 0.5],
                  ),
                ),
              ),
            ),
            // Text at the bottom
            Positioned(
                top: 20,
                right: 20,
                child:Text('Skip',style: TextStyle(fontFamily: 'Zolina',fontSize: 14),)),
            Positioned(
              bottom: screenHeight * 0.1,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Choose',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight:FontWeight.w500,
                        fontFamily: 'Zolina',
                        color: Colors.black, // Contrasting color for visibility
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Center(
                    child: Text(
                      'Beauty Products',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight:FontWeight.w100,
                        fontFamily: 'Zolina',
                        color: Colors.black, // Contrasting color for visibility
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: ElevatedButton(onPressed: (){}, child: Container( width:40,height:40,decoration: BoxDecoration(),)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
