import 'package:flutter/material.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/screen/colors.dart';

Widget experimentWidget(String name,String by,String date,String time,double editwidth){
  return Padding(
    padding: const EdgeInsets.all(10),
    child:  SizedBox(
      width: 280*editwidth,
      height: 41,
      child: Row(
          children: [
            Text("$name  ",
            style: TextStyle(
              fontFamily: AssetsManager.font,
              color: MyColor.black,
              fontSize: 20*editwidth,
              fontWeight: FontWeight.w500
            )),
            Text("$by  ",
            style: TextStyle(
              fontFamily: AssetsManager.font,
              color: MyColor.grayB7,
              fontSize: 12*editwidth,
              fontWeight: FontWeight.w700
            )),
            const Spacer(),
            Column(
              children: [
                Text(date,
                style: TextStyle(
                  fontFamily: AssetsManager.font,
                  color: MyColor.grayB7,
                  fontSize: 12*editwidth,
                  fontWeight: FontWeight.w400
                )),
                Text(time,
                style: TextStyle(
                  fontFamily: AssetsManager.font,
                  color: MyColor.grayB7,
                  fontSize: 12*editwidth,
                  fontWeight: FontWeight.w400
                )),
              ],
            )
          ]
        ),
    ),
  );

}