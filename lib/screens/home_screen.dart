import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app_ui/screens/search_screen.dart';
import 'package:plant_app_ui/utils/text_util.dart';
import '../components/category_component.dart';
import '../utils/animated_route.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:const  EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: TextUtil(text: "Find your\nFavorite plants",size: 30,)),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,AnimatedRoute().createRoute(const SearchScreen()));

                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                           border: Border.all( color: Colors.grey.shade400,width: 4)
                          ),
                          child:const  Icon(CupertinoIcons.search),
                        ),
                    ),

                  ],
                ),

                Stack(
                  children: [
                    SizedBox(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 90,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextUtil(text: "30% OFF",weight: true,color: Colors.white,),
                                  const   SizedBox(height: 10,),
                                    TextUtil(text: "03-21 Nov",color: Colors.white,)
                                  ],
                                )),
                                Expanded(child: SizedBox())
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: SizedBox(
                        height: 120,

                        child: Image.asset("assets/plant2.png")),),
                  ],
                ),
               const  SizedBox(height: 20,),
                CategoryWidget(),
              ],
            ),
          ),
        )
      ),
    );
  }

}
