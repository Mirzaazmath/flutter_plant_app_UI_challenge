import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/text_util.dart';
class DetailScreen extends StatelessWidget {
  int index;
   DetailScreen({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: Colors.black,
        actions:const  [
          Icon(CupertinoIcons.cart,),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag:index,
                  child: Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: Image.asset("assets/plant1.png"),
                  ),
                ),
                const SizedBox(height: 20,),
                TextUtil(text: "NameOfThePlant",size: 25,weight: true,),
                const SizedBox(height: 20,),
                TextUtil(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever",size: 13,),
                const SizedBox(height: 20,),
              ],
            ),),
          Expanded(child: Container(
            padding:const  EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                color: Theme.of(context).primaryColor
            ),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                       const  Icon(Icons.height,color: Colors.white,),
                       const  SizedBox(height: 3,),
                        TextUtil(text: "Height",size: 12,weight: true,color: Colors.white,),
                      const   SizedBox(height: 3,),
                        TextUtil(text: "20cm-40cm",size: 12,color: Colors.white,),

                      ],
                    ),
                    Column(
                      children: [
                        const  Icon(Icons.thermostat,color: Colors.white,),
                        const  SizedBox(height: 3,),
                        TextUtil(text: "Temperature",size: 12,weight: true,color: Colors.white,),
                        const   SizedBox(height: 3,),
                        TextUtil(text: "20*c to 25*c",size: 12,color: Colors.white,),

                      ],
                    ),
                    Column(
                      children: [
                        const  Icon(Icons.grass,color: Colors.white,),
                        const  SizedBox(height: 3,),
                        TextUtil(text: "Pot",size: 12,weight: true,color: Colors.white,),
                        const   SizedBox(height: 3,),
                        TextUtil(text: "Climatic pot",size: 12,color: Colors.white,),

                      ],
                    )
                  ],
                ),
               const  Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtil(text: "Total Price",color: Colors.white,),

                        TextUtil(text: "\$ 13.99",color: Colors.white,weight: true,),

                      ],
                    ),
                    Container(height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:const  Color(0xff67864a)
                    ),
                      alignment: Alignment.center,
                      child: TextUtil(text: "Add to Cart",weight: true,color: Colors.white,),
                    ),



                  ],
                ),

              ],
            ),
          ))
        ],
      ),
    );
  }
}
