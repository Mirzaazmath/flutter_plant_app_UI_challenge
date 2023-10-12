import 'package:flutter/material.dart';
import 'package:plant_app_ui/screens/landing_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:const  Color(0xffececee),
        primaryColor:const  Color(0xff76984c),
      ),
      debugShowCheckedModeBanner: false,
      home:const  LandingScreen(),
    );
  }
}
