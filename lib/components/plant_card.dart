import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../utils/text_util.dart';
import 'heart_widget.dart';
class PlantCard extends StatelessWidget {
  bool isHomeScreen;
   PlantCard({super.key,required this.isHomeScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen()));
      },
      child: Container(
          height: 300,
          margin: EdgeInsets.only(bottom:isHomeScreen?0: 20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Image.asset("assets/plant1.png"),
              ),
              TextUtil(text: "NameOfThePlant",size: 16),
              const   Spacer(),
              Row(
                children: [
                  Expanded(child: TextUtil(text: "\$12.99",size: 15,weight: true,)),

                  CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.black,
                      child: HeartWidget()
                  )

                ],
              ),

            ],
          )
      ),
    );
  }
}
