import 'package:flutter/material.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';

import '../colors.dart';

Widget taskWidget(String iconPath,String description,String date,bool fav,double editWidth){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.gray9D,width: 3),
              borderRadius: BorderRadius.circular(50)
            ),
            child: ClipOval(
            child: SizedBox.fromSize(
              size:  const Size.fromRadius(100), // Image radius
              child: Image.asset(iconPath, fit: BoxFit.cover),
            ),
          ),
          ),
          if(fav)
          const Icon(Icons.star,color: Colors.green,size:15 ,)
        ],
      ),
      SizedBox(width: 10*editWidth,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(description,
              style: TextStyle(
                fontFamily: AssetsManager.font,
                fontSize: 14*editWidth,
                fontWeight: FontWeight.w600,
                color: MyColor.black
              ),),
              Text(date,
              style: TextStyle(
                fontFamily: AssetsManager.font,
                fontWeight: FontWeight.w500,
                fontSize: 10*editWidth,
                color: MyColor.grayB7
              ),)
            ],
          )
    ],
  );
}