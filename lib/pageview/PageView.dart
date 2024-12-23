import 'package:flutter/material.dart';
import 'package:hydrahub/OnBoarding/SplashScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../HomeScreens/HomeScreen.dart';
import '../custom_text/Custom_color.dart';
import '../custom_text/Custom_text.dart';
import 'intropage1.dart';
import 'intropage2.dart';
import 'intropage3.dart';


class Page_View extends StatefulWidget {
  const Page_View({super.key});

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  PageController _controller=PageController();
  bool lastpage=false;

 /* void OneTimeScreen()async{
    SharedPreferences onetime= await SharedPreferences.getInstance();
    onetime.setBool('Done', true);
  }*/

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _controller,
              onPageChanged: (index){
              setState(() {
                lastpage=(index==2);
              });
          },
          children:[
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
          lastpage ?  Positioned(
            bottom: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: Center(
                      child: Container(
                      width: 80,
                        height: 80,
                        decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 1),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(Icons.arrow_forward_ios_outlined),

                      ),
                ),
          ) :
          Positioned(
              top: 20,
              right: 20,
              child:Text('Skip',style: TextStyle(fontFamily: 'Zolina',fontSize: 14),)),
          Container(
            margin: EdgeInsets.only(top: 320),
            alignment: Alignment(-0.75,0.25),
              child: Column(
                children: [
                 lastpage ? ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.grey.shade400,
                         side: BorderSide(
                             width: 1,
                             color:Color(0xC2FFE033)
                         ),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)
                         )
                     ),
                     onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                     },
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                       child:CustomText(text: 'Done', size: 16, fontWeight: FontWeight.w400,color: Colors.white,),
                     ))
                     :
                 ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        side: BorderSide(
                          width: 1,
                          color:MyColors.primarycolor
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      onPressed: (){
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child:CustomText(text: 'Skip', size: 16, fontWeight: FontWeight.w400,color: Colors.white,),
                      )),
                  SizedBox(height: 8,),
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: SlideEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey ,
                          activeDotColor:MyColors.primarycolor
                      ),
                  ),

                ],
              ))
        ]
      ),
    );
  }
}