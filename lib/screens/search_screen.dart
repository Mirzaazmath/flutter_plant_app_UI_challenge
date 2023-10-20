import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app_ui/utils/text_util.dart';

import '../components/heart_widget.dart';
import '../components/plant_card.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: Colors.black,
        title:TextUtil(text: "Search Products",color: Colors.grey.shade700,),
        actions:const  [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpeg",),
          ),
          SizedBox(width: 20,),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: Container(
            padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            height:60,
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),

                    child: TextFormField(
                      decoration:   InputDecoration(
                        hintText: "plants",
                          prefixIcon:Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(bottom: 10),

                            child: const Icon(CupertinoIcons.search,size: 20,),
                          ),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Container(

                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child:const  Icon(Icons.tune),


                ),
              ],
            ),
          )
        ),
         
       ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  TextUtil(text: "Found\n10 Result",size: 30,weight: true,),
                  const SizedBox(height: 20,),
                  for(int i=0;i<5;i++)...[
                    PlantCard(isHomeScreen: false,index: i,)
                  ]
                ],
              )),
             const  SizedBox(width: 20,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  for(int i=0;i<5;i++)...[
                    PlantCard(isHomeScreen: false,index: 1,)
                  ]
                ],
              )),
            ],
          ),
        ),
      ),



    );
  }
}
