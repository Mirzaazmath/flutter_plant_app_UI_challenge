import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/text_util.dart';
import 'home_screen.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
 late Timer _timer;

  PageController _slideController=PageController();


  List<Widget>slideList=[
    SizedBox(
      height: 300,
      child: Image.asset("assets/plant1.png"),
    ),
    SizedBox(
      height: 300,
      child: Image.asset("assets/plant2.png"),
    ),
    SizedBox(
      height: 300,
      child: Image.asset("assets/plant3.jpg"),
    ),
  ];
  int index=0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _timer= Timer.periodic(const Duration(seconds: 2), (timer) {
     if(_slideController.page==slideList.length-1){
       index=0;
       _slideController.animateToPage(0,duration:const  Duration(seconds: 1), curve: Curves.linear);
     }else{
       _slideController.nextPage(duration:const  Duration(seconds: 1), curve: Curves.linear);
       index++;

     }
     setState(() {

     });


    });
  }
  @override
  void dispose() {
    _timer.cancel();
    _slideController.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(20,),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextUtil(text: "Skip"),
              ),
            ),
            SizedBox(
              height: 300,
              child: PageView(
                physics:const  NeverScrollableScrollPhysics(),

                controller:_slideController,
                children: slideList,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<slideList.length;i++)...[AnimatedContainer(duration: Duration(seconds: 1),
                  height: 10,
                  width: index==i? 20:10,
                  margin:const  EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index==i?const  Color(0xff67864a):Colors.grey.shade400
                  ),
                )]
              ],
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.start,
              text:const  TextSpan(
                text: 'Enjoy Your\nlife with ',
                style:  TextStyle(fontSize: 35,color: Colors.black),
                children:  <TextSpan>[
                  TextSpan(text: 'Plants', style: TextStyle(fontWeight: FontWeight.bold)),

                ],
              ),
            ),
           const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).primaryColor,
                child:const  Icon(Icons.arrow_forward,size: 35,color: Colors.white,),
              ),
            ),
            const Spacer(),


           
          ],
        ),
      )

    );
  }
}
