import 'package:flutter/material.dart';

import '../colors.dart';

Widget reportExperimentWidget(double editWidth){
  return Row(
    children: [
      Text(' ',
          style: TextStyle(
            fontSize: 16*editWidth,
            fontWeight: FontWeight.w400,
            color: MyColor.black,
          ),),
      Text(' min',
          style: TextStyle(
            fontSize: 16*editWidth,
            fontWeight: FontWeight.w400,
            color: MyColor.black,
          ),),
      Text(' ',
          style: TextStyle(
            fontSize: 16*editWidth,
            fontWeight: FontWeight.w400,
            color: MyColor.black,
          ),),
      Text(' ',
          style: TextStyle(
            fontSize: 16*editWidth,
            fontWeight: FontWeight.w400,
            color: MyColor.black,
          ),),
          //Condition
      Text(' mg/l',
          style: TextStyle(
            fontSize: 16*editWidth,
            fontWeight: FontWeight.w400,
            color: MyColor.black,
          ),),
      //Condition
      Text(' :9',
          style: TextStyle(
            fontSize: 16*editWidth,
            fontWeight: FontWeight.w400,
            color: MyColor.black,
          ),),

    ],
  );
}