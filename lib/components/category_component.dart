import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app_ui/components/plant_card.dart';
import 'package:plant_app_ui/utils/text_util.dart';

import 'heart_widget.dart';
class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String>_catergoryList=["All","Indoor","Outdoor","Popular","Exotic"];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
           children: [
             for(int i=0;i<_catergoryList.length;i++)...[
               GestureDetector(
                 onTap: (){
                   setState(() {
                     index=i;
                   });
                 },
                 child: Container(
                   padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                   margin:const  EdgeInsets.only(left: 10),
                   decoration: BoxDecoration(
                     color: index==i?Theme.of(context).primaryColor.withOpacity(0.1):Theme.of(context).scaffoldBackgroundColor,
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all(color:index==i?Theme.of(context).primaryColor: Colors.grey.shade300,width: 2),
                   ),
                   child: TextUtil(text:_catergoryList[i],color:index==i?Theme.of(context).primaryColor: Colors.grey,),
                 ),
               ),
               
             ]
           ],
          ),
        ),
        const SizedBox(height: 20,),
        GridView.count(
          physics:const  NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 0.6,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,

          children: <Widget>[

         for(int i=0;i<10;i++)...[
           PlantCard(isHomeScreen: true,index:i)
         ]

          ],
        ),
        const SizedBox(height: 50,)
        
      ],
    );
  }
}
